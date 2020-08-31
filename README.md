<style>
	.btn {
	  background-color: #0090ff;
	  border: none;
	  color: white;
	  padding: 12px 30px;
	  cursor: pointer;
	  font-size: 20px;
	}
	.btn:hover {
	  background-color: RoyalBlue;
	} 	
</style>

# xrechnung-visualization-codelist-resolve
Resolving codelists for XRechnung-Visualization

Mit den im GitHub Repositorium der KoSIT bereitgestellten XSL Transformatoren (https://github.com/itplr-kosit/xrechnung-visualization) kann eine elektronische Rechnung gem. der Europäischen Norm EN16931 sowie davon abgeleitete CIUS, wie z.B. XRechnung, in eine HTML- oder PDF-Ansicht überführt werden.

Mit den hier bereitgestellten Skripten kann innerhalb dieser XSL Transformation zusätzlich zu den enthaltenen Codelistenwerten eine Beschreibung des jeweiligen Codelistenwertes ergänzt werden. Die originalen Codewerte werden dazu nicht verändert, sondern die Beschreibung lediglich in Klammer ergänzt.

Details und Beispiel siehe: https://github.com/jcthiele/xrechnung-visualization-codelist-resolve/blob/master/Dokumentation.pdf

Die Ausgangsbasis, die XSL Transformatoren der KoSIT, stehen unter der Apache License 2.0. Details siehe hier: https://github.com/itplr-kosit/xrechnung-visualization.

Die Codelisten-Auflösung ist Bestandteil der [OpenXRechnungToolbox](https://jcthiele.github.io/OpenXRechnungToolbox/), kann aber auch in anderen Projekten unabhängig von der OpenXRechnungToolbox für eine Verbesserung der Visualisierung eingesetzt werden. Daher existiert hier das gesonderte Repository.


<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Auto width -->
<center><a href="https://github.com/jcthiele/xrechnung-visualization-codelist-resolve/releases" target="_blank"><button class="btn"><i class="fa fa-download"></i> Download</button></a></center>
