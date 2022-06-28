from django.contrib import admin
from django.urls import path, include, re_path
from rest_framework import routers

from order.views import OrderViewSet, PersonalOrdersViewSet, DeliveryViewSet
from profile.views import ProfilesViewSet, PersonalProfileViewSet

router = routers.DefaultRouter(trailing_slash=False)
router.register('orders', OrderViewSet, basename='orders-details')
router.register('personal-orders', PersonalOrdersViewSet, basename='personal-orders-details')
router.register('delivery', DeliveryViewSet, basename='delivery-details')
router.register('profiles', ProfilesViewSet, basename='profiles-details')
router.register('my-profile', PersonalProfileViewSet, basename='my-profile-details')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include(router.urls)),
    path('api/v1/auth', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
    path('api/v1/drf-auth/', include('rest_framework.urls'))
]
