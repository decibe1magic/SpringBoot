# SpringBoot

# WebApp 배포 yaml
---
# Docs for the Azure Web Apps Deploy action: https://github.com/Azure/webapps-deploy
# More GitHub Actions for Azure: https://github.com/Azure/actions

name: Build and deploy JAR app to Azure Web App - BlackCode

on:
  push:
    branches:
      - master
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Set up Java version
        uses: actions/setup-java@v1
        with:
          java-version: '17'
            
      # 수정내역 
      # 1. gradle buile를 위한 권한 부여
      - name: Grant execute permission for gradlew
        run: chmod +x gradlew
        working-directory: BLACKCODE # 1.프로젝트 변경시 수정사항
      
      # 2. Gradle build 진행
      - name: Build with Gradle
        run : |
          cd BLACKCODE             # 해당 디렉토리로 이동 # 2.프로젝트 변경시 수정사항
          ./gradlew build -x test # Gradle 빌드 실행
      
      # 3. 배포할 파일의 경로를 확인
      - name: Check path
        run: ls -lR
      
      - name: Upload artifact for deployment job
        uses: actions/upload-artifact@v2
        with:
          name: blackcode-app
          path: '${{ github.workspace }}/BLACKCODE/build/libs/*.war' # 3.프로젝트 변경시 수정사항
          # path: '${{ github.workspace }}/<프로젝트명>/build/libs/*.jar'
      
      # 4. artifact 생성 확인
      - name: List files in build/libs directory
        run: ls BLACKCODE/build/libs # 4.프로젝트 변경시 수정사항
      
  deploy:
    runs-on: ubuntu-latest
    needs: build
    environment:
      name: 'Production'
      url: ${{ steps.deploy-to-webapp.outputs.webapp-url }}
    
    steps:
      - name: Download artifact from build job
        # uses: actions/download-artifact@v2
        uses: actions/download-artifact@v3 # v2의 버그로 v3
        with:
          name: blackcode-app

      - name: Deploy to Azure Web App
        id: deploy-to-webapp
        uses: azure/webapps-deploy@v2
        with:
          app-name: 'BlackCode'
          slot-name: 'Production'
          publish-profile: ${{ secrets.AZUREAPPSERVICE_PUBLISHPROFILE_3189047D09AC475C990FBF228C90732E }}
          # package: '*.ar'
          package: '*SNAPSHOT.war'

# AKS 배포 yaml
---
