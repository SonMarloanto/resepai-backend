GOOGLE_PROJECT_ID=angular-axe-351410
CLOUD_RUN_SERVICE=mobile-backend-login-register
INSTANCE_CONNECTION_NAME=angular-axe-351410:asia-southeast2:resepai12
DB_USER=root
DB_PASS=12345678
DB_NAME=resepai

gcloud build submit --tag gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
 --project=$GOOGLE_PROJECT_ID

gcloud run deploy $CLOUD_RUN_SERVICE \
 --image gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
 --add-cloudsql-instances $INSTANCE_CONNECTION_NAME \
 --update-env-vars INSTANCE_CONNECTION_NAME=$INSTANCE_CONNECTION_NAME, DB_PASS=$DB_PASS, DB_USER=$DB_USER, DB_NAME=$deploy
 --platform managed \
 --region asia-southeast2 \
 --allow-unauthenticated \
 --project=$GOOGLE_PROJECT_ID