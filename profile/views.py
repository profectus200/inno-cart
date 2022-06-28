from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from .models import ProfileModel
from .serializers import ProfileSerializer


class ProfilesViewSet(viewsets.ModelViewSet):
    queryset = ProfileModel.objects.all()
    serializer_class = ProfileSerializer
    permission_classes = (IsAuthenticated,)


class PersonalProfileViewSet(viewsets.ModelViewSet):
    queryset = ProfileModel.objects.all()
    serializer_class = ProfileSerializer
    permission_classes = (IsAuthenticated,)
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('user',)

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.filter(user=self.request.user)
        return queryset
