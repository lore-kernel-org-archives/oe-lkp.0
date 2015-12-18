Content-Type: multipart/mixed; boundary="===============6961807863367672293=="
MIME-Version: 1.0
From: Du, Changbin <changbin.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] usb: gadget: forbid queuing request to a disabled ep
Date: Fri, 18 Dec 2015 07:34:32 +0000
Message-ID: <0C18FE92A7765D4EB9EE5D38D86A563A01DF9007@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <87bn9pdrkq.fsf@saruman.tx.rr.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6961807863367672293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> >
> > diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> > index 3d583a1..0c5d9ea 100644
> > --- a/include/linux/usb/gadget.h
> > +++ b/include/linux/usb/gadget.h
> > @@ -402,6 +402,9 @@ static inline void usb_ep_free_request(struct
> usb_ep *ep,
> >  static inline int usb_ep_queue(struct usb_ep *ep,
> >  			       struct usb_request *req, gfp_t gfp_flags)
> >  {
> > +	if (WARN_ON_ONCE(!ep->enabled && !ep->address))
> =

> this will only trigger for a disabled ep0. Are you testing any of your
> patches at all ?
> =

> --
> balbi
Oops, I sent a wrong patch. I will send right patch again as v4, very sorry=
 for this.
The right patch has been verified on 3.14 by back-porting related 1 patch.

--===============6961807863367672293==--

