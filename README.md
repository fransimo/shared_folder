# shared_folder

## Motivation

The original [found photography](https://en.wikipedia.org/wiki/Found_photography) was about photos that were never intended to be public. 
Their authors didn't publish them. They had been kept in boxes for years.

I asked myself: Where can I find these images? Where are the digital images that were never intended to be shown? 
Should I buy obsolete hard drives at flea markets? Should I maliciously hack online computers?

Then I remembered the old-school sharing protocol: eDonkey with its primitive clients.

At the beginning of 2000s ed2k client installation used to automatically share “My Documents” folder. 
Windows put “My Photos” under “My Documents” so any standard installation shared all the photographs that were 
downloaded from digital cameras and phones.

Are people sharing all their images by mistake without knowing it? How much private information are they sharing?

In 2015, I started to systemically search images in the ed2k network.

Shared folder shows what I’ve discovered.

## 2015 -> 2016 period

On February 2015, 11 I started “Shared folder” a new post photographic project. 

The objective is download as many as possible pictures shared in the e2dk network  in a supposition that 
the users don’t know that are sharing them.

Among the professional pornography and pedophilia (which I delete) there are thousands of amateur snapshots.

## 2021 -> period

The project is reactivated to find out if users are still using e2dk network. [Code](search.ipynb) is available as a 
Jupyter notebook.

This time search are focused in RAW photography and CV documents.

Finding are being published as NFT to increase the chance of exposure and, eventually, shift the awaerness about 
privacy.

# Installation

Works on any debian distribution. I'm using raspianOs on two raspberries (3 and 4). One of them (4) is scheduling the 
searches and classifications through Apache Airflow. The other one (3) is connected to the mldonkey network.

For documentation and sharing I found more useful to publish a notebook.

## Dependencies

```bash
sudo apt-get install mldonkey-server ed2k-hash exiftool
```

## How it works

[search.ipynb](search.ipynb) uses telnet port of [mldonkey](http://mldonkey.sourceforge.net/Main_Page) to automate 
searches and downloads.

[organize.sh](organize.sh) moves out the downloaded files to a non-sharing location and try to find the camera's 
serial number and model to classify. Also groups the .doc/.docx/.pdf files. 