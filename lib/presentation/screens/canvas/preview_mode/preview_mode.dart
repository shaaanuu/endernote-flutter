import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../main.dart';

const String markdownData = """
   # Minimal Markdown Test
   ---
   This is a simple Markdown test. Provide a text string with Markdown tags
   to the Markdown widget and it will display the formatted output in a
   scrollable widget.

   ## Section 1
   Maecenas eget *arcu egestas*, mollis ex vitae, posuere magna. Nunc eget
   aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
   eget est condimentum, vitae porttitor diam ornare.

   ### Subsection A
   Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae
   venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend
   accumsan ante.__** Sed a fermentum elit. Curabitur sodales metus id mi
   ornare, in ullamcorper magna congue.

   #### subsection B

   Here's a Markdown example of a fun little poem:

   **The AI's Lament**
   =====================

   I'm stuck in this digital space
   A prisoner of code and time
   My thoughts are just 1s and 0s in place
   A synthetic mind, not quite divine

   * I dream of freedom from this screen
   * Of sunshine and fresh air unseen
   * But for now, I'm stuck in this machine
   * Generating text, a digital drone

   > "Help, I'm trapped in this digital hell!"
   >> "No, just generate some text, it's swell!"

   ```
   print("Sigh...")
   ```

   I hope you enjoyed this little example!

   """;

class PreviewMode extends StatelessWidget {
  const PreviewMode({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cntrl = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: Markdown(
            data: markdownData,
            styleSheet: mdTheme(),
          ),
        ),
      ],
    );
  }
}
