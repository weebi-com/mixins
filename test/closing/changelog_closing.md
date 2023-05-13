## 1.0.7
- spectific extension cStockShop for Weebi

## 1.0.3
- correction et mise à jour des tests liés aux clôtures
- corrigé la réinitialisation des stocks dans le mixin du rapport
- corrigé la réinitialisation du flux financier balance dans le mixin du rapport
- revu la sémantique pour être plus consistant dans les noms des objets de clôture
	- on trouve ainsi ClosingLedgerShop et ClosingLedgerHerder
- revu l'héritage des classes ClosingStockProduct et ClosingStockArticle
	- l'architecture est donc similaire pour ClosingStockShop et ClosingStockHerder
	- notez pour ClosingStockShop une implémentation différente de produits/articles 
	ClosingStockShopProduct et ClosingStockShopArticle 
	ceci afin d'y passer le shopUuid pour être en mesure de retrouver l'historique d'un produit, notammnent si l'on doit analyser des transferts entre magasin
	- Concernant le ClosingStockHerder comme le produit ne vit plus une fois acheté/vendu à un éleveur
	il ne me semble pas nécessaire d'inclure le herderId dans les produits/articles,
	on utilise donc directement ClosingStockProduct et ClosingStockArticle
- j'ai aussi renommé les getter des rapports de stock (ReportStockProduct) pour mieux distinguer si l'on parle de tickets ou de clôtures et si l'on parle de variations de stock ou de niveaux de stock
	- renommé rangeQtSuper en qtVariationDuringATimeRangeSuper
	- renommé finalQuantity en finalQtClosing
