import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class generalSolutionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey,
        body:TeXView(
          renderingEngine: TeXViewRenderingEngine.mathjax(),
          child: TeXViewDocument(r"""<p>                                
                       When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                       $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
                    //style: TeXViewStyle.fromCSS(
                      //  'padding: 15px; color: white; background: blue'))
              ),)
            );
  }
}