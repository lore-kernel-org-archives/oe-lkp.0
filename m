Content-Type: multipart/mixed; boundary="===============1258815450033287001=="
MIME-Version: 1.0
From: Du, Changbin <changbin.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] usb: gadget: forbid queuing request to a disabled ep
Date: Thu, 17 Dec 2015 09:35:18 +0000
Message-ID: <0C18FE92A7765D4EB9EE5D38D86A563A01DF8A53@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <87h9jifi9x.fsf@saruman.tx.rr.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1258815450033287001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> >> 2.5.0
> >
> > With this patch, ep0 transfer breaks. it because the 'enabled' of ep0
> > is not set. Ep0 is not enabled by usb_ep_enable, but in UDC driver. So
> > there need another patch to set ep0's flag also.
> =

> yeah, we don't like regressions :-) So the fix should come before
> $subject to avoid a regression.
> =

> --
> balbi
It is hard to determine if ep0 is enabled or not in gadget API layer. Becau=
se
it is controlled by udc driver, it may enable it at pullup, vbussession...
But here, we can ignore for control-ep, considering it always enabled during
usb session.

--===============1258815450033287001==--

