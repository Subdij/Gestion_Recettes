<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use App\Repository\UserRepository;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            $entityManager->persist($user);
            $entityManager->flush();

            // do anything else you need here, like send an email

            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form,
        ]);
    }

    #[Route('/user', name: 'user_index')]
    public function index(UserRepository $userRepository): Response
    {
        
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $users = $userRepository->findAll();

        return $this->render('user/index.html.twig', [
            'users' => $users,
        ]);
    }

    #[Route('/user/{id}/delete', name: 'user_delete')]
    public function user_delete(User $user, EntityManagerInterface $entityManager, TokenStorageInterface $tokenStorage, SessionInterface $session): Response

    {
        if ($this->getUser() === $user) {

            $tokenStorage->setToken(null);

            $session->invalidate();
    
            $entityManager->remove($user);
            $entityManager->flush();
    
            return $this->redirectToRoute('app_login');
        }
    
        $entityManager->remove($user);
        $entityManager->flush();
    
        return $this->redirectToRoute('user_index');
    }
}
