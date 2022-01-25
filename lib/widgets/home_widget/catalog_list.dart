
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
     itemCount: CatalogModel.items?.length,
     itemBuilder: (context,index){
       final catalog = CatalogModel.items?[index];
       return InkWell(child: CatalogItem(catalog: catalog),
       onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetail(catalog: catalog),
       ),
       ),
       );
     }
    );
  }
}

