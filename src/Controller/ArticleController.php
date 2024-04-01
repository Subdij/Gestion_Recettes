<?php

namespace App\Controller;

use App\Entity\Article;
use App\Form\ArticleType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ArticleController extends AbstractController
{

    #[Route('/article', name: 'app_article')]
    public function index(Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger, ParameterBagInterface $params): Response
    {
        $article = new Article();
        $form = $this->createForm(ArticleType::class, $article);
    
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $imageFile */
            $imageFile = $form->get('imageFilename')->getData();
            if ($imageFile) {
                $fileExtension = $imageFile->guessExtension();
                if (!in_array($fileExtension, ['jpg', 'jpeg', 'png'])) {
                    $this->addFlash('danger', 'Seuls les fichiers JPG et PNG sont autorisés.');
                    return $this->redirectToRoute('app_article');
                }
    
                $originalFilename = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$fileExtension;
    
                try {
                    $imageFile->move(
                        $params->get('articles_directory'),
                        $newFilename
                    );
                    $article->setImageFilename($newFilename);
                } catch (FileException $e) {
                    
                }
            }
    
            $entityManager->persist($article);
            $entityManager->flush();
    
            return $this->redirectToRoute('app_article');
        }
    
        $articles = $entityManager->getRepository(Article::class)->findAll();
    
        return $this->render('article/index.html.twig', [
            'articles' => $articles,
            'form' => $form->createView(),
        ]);
    }



#[Route('/article/{id}', name: 'article_show')]
public function article_show(int $id, EntityManagerInterface $entityManager): Response
{
    $article = $entityManager->getRepository(Article::class)->find($id);

    if (!$article) {
        throw $this->createNotFoundException('L\'article demandé n\'existe pas.');
    }

    return $this->render('article/show.html.twig', [
        'article' => $article,
    ]);
}







#[Route('/article/edit/{id}', name: 'article_edit')]
public function edit(int $id, Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger, ParameterBagInterface $params): Response
{
    $article = $entityManager->getRepository(Article::class)->find($id);

    if (!$article) {
        throw $this->createNotFoundException('L\'article demandé n\'existe pas.');
    }

    $form = $this->createForm(ArticleType::class, $article);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        /** @var UploadedFile $imageFile */
        $imageFile = $form->get('imageFilename')->getData();
        if ($imageFile) {
            $fileExtension = $imageFile->guessExtension();
            if (!in_array($fileExtension, ['jpg', 'jpeg', 'png'])) {
                $this->addFlash('danger', 'Seuls les fichiers JPG et PNG sont autorisés.');
                return $this->redirectToRoute('article_edit', ['id' => $id]);
            }

            $originalFilename = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);
            $safeFilename = $slugger->slug($originalFilename);
            $newFilename = $safeFilename.'-'.uniqid().'.'.$fileExtension;

            try {
                $imageFile->move(
                    $params->get('articles_directory'),
                    $newFilename
                );
                $article->setImageFilename($newFilename);
            } catch (FileException $e) {
                // Gérer l'exception si quelque chose se passe pendant le téléchargement du fichier
            }
        }

        $entityManager->flush();
        return $this->redirectToRoute('app_article');
    }

    return $this->render('article/edit.html.twig', [
        'article' => $article,
        'form' => $form->createView(),
    ]);
}








    #[Route('/article/delete/{id}', name: 'article_delete')]
    public function delete(int $id, EntityManagerInterface $entityManager): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        
        $article = $entityManager->getRepository(Article::class)->find($id);

        if (!$article) {
            throw $this->createNotFoundException('L\'article à supprimer n\'existe pas.');
        }

        $entityManager->remove($article);
        $entityManager->flush();

        return $this->redirectToRoute('app_article');
    }
}
