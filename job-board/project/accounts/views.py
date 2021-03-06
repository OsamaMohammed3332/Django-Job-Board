from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render
from rest_framework.generics import get_object_or_404
from .forms import SignupForm, UserForm, ProfileForm
from .models import Profile
from rest_framework.authtoken.models import Token
# Create your views here.


def signUp(request):
    if request.method == "POST":
        form = SignupForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect("/accounts/profile")


    else:
        form = SignupForm()

    return render(request, 'registration/signup.html', {'form': form})





def profile(request):
    profile = Profile.objects.get(user = request.user)
    return render(request, 'accounts/profile.html', {'profile': profile})



def profile_edit(request):
    profile = Profile.objects.get(user=request.user)

    if request.method == "POST":
        userform = UserForm(request.POST, instance=request.user)
        profileform = ProfileForm(request.POST, request.FILES, instance=profile)
        if userform.is_valid() and profileform.is_valid():
            userform.save()
            my_profile = profileform.save(commit=False)
            my_profile.user = request.user
            my_profile.save()
            return redirect("/accounts/profile")


    else:
        userform = UserForm(instance=request.user)
        profileform = ProfileForm(instance=profile)


    context = {
        'userform':userform,
        'profileform':profileform,
    }
    return render(request, 'accounts/profile_edit.html', context)