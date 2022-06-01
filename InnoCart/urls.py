"""InnoCart URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from user import views as user_views
from order import views as order_views
from rest_framework import routers

user_router = routers.DefaultRouter(trailing_slash=False)
order_router = routers.DefaultRouter(trailing_slash=False)
user_router.register('details', user_views.User)
order_router.register('details', order_views.Order)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('users', include(user_router.urls)),
    path('orders', include(order_router.urls)),
]
