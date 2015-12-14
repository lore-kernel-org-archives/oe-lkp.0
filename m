Content-Type: multipart/mixed; boundary="===============2442697050505319913=="
MIME-Version: 1.0
From: Du, Changbin <changbin.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] usb: gadget: forbid queuing request to a disabled ep
Date: Mon, 14 Dec 2015 10:20:38 +0000
Message-ID: <0C18FE92A7765D4EB9EE5D38D86A563A01DF62CC@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <1450064926-849-1-git-send-email-changbin.du@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2442697050505319913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index 3d583a1..b566a4b 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -402,6 +402,9 @@ static inline void usb_ep_free_request(struct usb_ep
> *ep,
>  static inline int usb_ep_queue(struct usb_ep *ep,
>  			       struct usb_request *req, gfp_t gfp_flags)
>  {
> +	if (WARN_ON_ONCE(!ep->enabled))
> +		return -ESHUTDOWN;
> +
>  	return ep->ops->queue(ep, req, gfp_flags);
>  }
> =

> --
> 2.5.0
With  this patch, ep0 transfer breaks. it because the 'enabled' of ep0  is =
not set. Ep0 =

is not enabled by usb_ep_enable, but in UDC driver. So there need another p=
atch
to set ep0's flag also.


--===============2442697050505319913==--

