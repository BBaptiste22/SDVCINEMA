# SDVCINEMA

Application iOS développée en **SwiftUI** permettant d'afficher des
films et séries populaires via l'API TMDB, avec gestion des favoris
grâce à **SwiftData**.

------------------------------------------------------------------------

## 📱 Fonctionnalités

✅ Affichage des films populaires
✅ Affichage des séries populaires
✅ Recherche en temps réel
✅ Page détail pour chaque média
✅ Ajout / Suppression des favoris
✅ Persistance locale avec SwiftData
✅ Navigation moderne avec NavigationStack

------------------------------------------------------------------------

## 🏗 Architecture du projet

### 📦 Models

-   Movie.swift
-   Serie.swift
-   Favorite.swift
-   DetailPresentable.swift
-   PopularResponse.swift

### 🧠 ViewModels

-   MovieViewModel.swift
-   SerieViewModel.swift

### 🖼 Views

-   HomeView.swift
-   MovieView.swift
-   SerieView.swift
-   DetailView.swift
-   FavoriteView.swift

### Services

-   APIService.swift

------------------------------------------------------------------------

## 🔌 API utilisée

L'application utilise l'API **The Movie Database (TMDB)**.

### 🎬 Films

-   id
-   title
-   overview
-   poster_path
-   release_date

### 📺 Séries

-   id
-   name
-   overview
-   poster_path
-   first_air_date

------------------------------------------------------------------------

## ⭐ Gestion des Favoris

Les favoris sont gérés avec **SwiftData**.

Chaque favori contient : - id - title - overview - posterPath - date -
isMovie

Ajout / suppression via l'étoile ⭐ dans la DetailView.

------------------------------------------------------------------------

## 🔎 Recherche

Implémentée avec `.DetailPresentable()` et filtrage via
`localizedCaseInsensitiveContains`.

------------------------------------------------------------------------

## 🛠 Technologies utilisées

-   Swift
-   SwiftUI
-   SwiftData
-   AsyncImage
-   Codable



