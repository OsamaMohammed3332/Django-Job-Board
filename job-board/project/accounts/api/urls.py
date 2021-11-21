from django.urls import path
from accounts.api.views import (
    registration_api,
    my_profile_api,
    edit_profile_api,
    password_change_api,
    password_reset_api,
)
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('register', registration_api, name = 'register_api'),
    path('password_reset', password_reset_api, name = 'password_reset_api'),
    path('login', obtain_auth_token, name = 'login_api'),
    path('my_profile', my_profile_api, name = 'my_profile_api'),
    path('password_change', password_change_api, name = 'password_change_api'),
    path('edit_profile', edit_profile_api, name = 'edit_profile_api'),

]