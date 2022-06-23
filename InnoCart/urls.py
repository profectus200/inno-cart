from django.contrib import admin
from django.urls import path, include, re_path
from profile.views import ProfileViewSet
from order.views import OrderViewSet, PersonalOrderViewSet
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('orders', OrderViewSet, basename='details')
router.register('personal', PersonalOrderViewSet, basename='personal-details')
router.register('profiles', ProfileViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include(router.urls)),
    path('api/v1/auth', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
]
