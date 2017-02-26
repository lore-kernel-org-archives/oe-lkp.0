Content-Type: multipart/mixed; boundary="===============7437141679654642338=="
MIME-Version: 1.0
From: Stefan Schmidt <stefan@osg.samsung.com>
To: lkp@lists.01.org
Subject: Re: [ieee802154_unregister_hw] bea5b158ff BUG: scheduling while atomic: swapper/1/0x00000002
Date: Sun, 26 Feb 2017 23:12:54 +0100
Message-ID: <429e0a0c-dc05-0785-5885-01bc19c8e502@osg.samsung.com>
In-Reply-To: <79b37cfd-5084-59a6-9044-cdc2017e1fa2@pengutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7437141679654642338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello.

On 02/26/2017 12:07 PM, Alexander Aring wrote:
>
> Hi,
>
> On 02/26/2017 10:43 AM, Fengguang Wu wrote:
>> Greetings,
>>
>> FYI, this debug patch discloses an old-but-still-active bug in
>> ieee802154/fakelb. The attached reproduce-* script may help debug it.
>>
>
> fixed by: bdca1fd9a6df ("fakelb: fix schedule while atomic").

Some more context. Looking at your config and script file names they =

suggest this is tested with 4.8.0-rc4. Fengguang, is that correct?

The fix from above is in 4.8.0-rc7
git describe bdca1fd9a6df
v4.8-rc6-1377-gbdca1fd

> It should be send to stable. Stefan can you do that please?

The latest stable kernel is 4.10.1 and the latest longterm stable is =

4.9.13. Both of them should have this fix already.

If there is a desire I could try sending it for the older longterm =

stable tree 4.4.x. Not sure if this is really worth the effort. Comments?

regards
Stefan Schmidt

--===============7437141679654642338==--

