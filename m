Content-Type: multipart/mixed; boundary="===============4718287630579746915=="
MIME-Version: 1.0
From: Alexander Aring <aar@pengutronix.de>
To: lkp@lists.01.org
Subject: Re: [ieee802154_unregister_hw] bea5b158ff BUG: scheduling while atomic: swapper/1/0x00000002
Date: Sun, 26 Feb 2017 12:07:28 +0100
Message-ID: <79b37cfd-5084-59a6-9044-cdc2017e1fa2@pengutronix.de>
In-Reply-To: <20170226094334.z4sz7yk3loxagi7z@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4718287630579746915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

On 02/26/2017 10:43 AM, Fengguang Wu wrote:
> Greetings,
> =

> FYI, this debug patch discloses an old-but-still-active bug in
> ieee802154/fakelb. The attached reproduce-* script may help debug it.
> =


fixed by: bdca1fd9a6df ("fakelb: fix schedule while atomic").

It should be send to stable. Stefan can you do that please?
I am busy because my exam work.

- Alex

--===============4718287630579746915==--

