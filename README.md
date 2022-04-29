# Layout Description

* `xmlfiles`: TUNICO xml data (CC BY-NC-SA 3.0 AT) slightly changed for use with the VOICE 3.0 wrokflow
  * Added xml:id attributes to tei:u tags
* `registry`: configuration file for NoSkE, references the verticals as `.../verticals/tunico`
* `verticals`: contains the vertical data used by NoSkE
  * generated using `to_noske_vert.xsl` XSL 3.0 and OxygenXML

## Run NoSkE

`docker run --rm -it -v Q:\tunico-data\verticals:/var/lib/manatee/data/verticals -v Q:\tunico-data\registry:/var/lib/manatee/registry -p 4000:8080 -e CORPLIST=tunico acdhch/noske:4.24.6-2.167.10-open`
See also https://hub.docker.com/r/acdhch/noske

## Corpus data source

[TUNICO corpus](https://arche.acdh.oeaw.ac.at/browser/oeaw_detail/34882)
Licensed [CC BY-NC-SA 3.0 AT](https://creativecommons.org/licenses/by-nc-sa/3.0/at/)