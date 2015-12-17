Content-Type: multipart/mixed; boundary="===============1203161486608988426=="
MIME-Version: 1.0
From: Felipe Balbi <balbi@ti.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] usb: gadget: forbid queuing request to a disabled ep
Date: Thu, 17 Dec 2015 09:26:29 -0600
Message-ID: <87bn9pdrkq.fsf@saruman.tx.rr.com>
In-Reply-To: <1450346431-8064-1-git-send-email-changbin.du@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1203161486608988426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

changbin.du(a)intel.com writes:
> From: "Du, Changbin" <changbin.du@intel.com>
>
> Queue a request to disabled ep  doesn't make sense, and induce caller
> make mistakes.
>
> Here is a example for the android mtp gadget function driver. A mem
> corruption can happen on below senario.
> 1) On disconnect, mtp driver disable its EPs,
> 2) During send_file_work and receive_file_work, mtp queues a request
>    to ep. (The mtp driver need improve its synchronization logic!)
> 3) mtp_function_unbind is invoked and all mtp requests are freed.
> 4) when udc process the request queued on step 2, will cause kernel
>    NULL pointer dereference exception.
>
> Signed-off-by: Du, Changbin <changbin.du@intel.com>
> ---
> change from v2: igonre ep0 as it always enabled during usb session.
> change from v1: add WARN_ON_ONCE message.
> ---
>  include/linux/usb/gadget.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index 3d583a1..0c5d9ea 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -402,6 +402,9 @@ static inline void usb_ep_free_request(struct usb_ep =
*ep,
>  static inline int usb_ep_queue(struct usb_ep *ep,
>  			       struct usb_request *req, gfp_t gfp_flags)
>  {
> +	if (WARN_ON_ONCE(!ep->enabled && !ep->address))

this will only trigger for a disabled ep0. Are you testing any of your
patches at all ?

-- =

balbi

--===============1203161486608988426==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSldjdFFtQUFvSkVJYU9zdUExeXFSRXNXb1FBSnBlODBmNmZMVmdsVkpjSXAySnc5UlAK
dWVqaDhhUmhTTUNIMFdkZ2pTejMwVGV3UXlhdnBIODU3ZjJWYnhHeFN2dk5ZVGxUeDUrQk12ZzVR
QnV2Q3p1VApFZ3ZqSkhQZFNLaGhwVkVNZjNMaStYVXYraDdraDVrbmpad2tJekU0YUFRZ2NGd25F
WFdVOG1uRlVPanVlTzlFCklUY0dzcy9ma0VsTTdBUlNtaEZGSUcrcG1xRHR2eWVwdlY3RVBrWkFi
VkV0MHZJUXJ4VEEwN0V6eDNRd1FlcUkKYjZvUDkvSkRBTXlhMTc0cDloYUpTenBWN1g5d3lWRE4z
cTljbThxa0tKQnhuOXBRV25xZFFiZ056NktIcFJLaQplRE1RNkV4dzF5QytmdzE3UDZFY3VCNVRB
Y3JReG5wMjBqcnpYYmZQQjFwcm9jWFZYbzY4bjhHRUpOOU5EaWx2CjA5UE4xdk9neUtIU2h5cWU4
bzBhdFBNcFBCU2ZqUVY5azExTkwwWk1VMDFnUkJDM1FaMENGOUwwWUNGYXd1MUUKYnc5QWV6OEUw
VHQ5WnM4WG9PSmZjZndFOVdoMWNDVENlN1plNk5oTUtHaXhjM1NlNFNXaDJNY2J5Z1dyVE92ZApa
bWg5aEpxbkhZODN6ckxBNUh3QkpIRlM1UHVPcDEvSFdjVm1tOWhJUy9LVXZsTUVXTDB3TkVaWFox
WVFudFU4CnRpT2YvVEJobVp0ZlNBaVhVVzY4ZVA4czE5Qms5V0FRVkMzS0hnb3hNVDNTUTA1OEF1
ZHgrcXZRUVhrNmF2emcKUkY4YVFMODRnSGg0eXhaR1VaR2NnVTZGd0wxRjlGd04yTUxXcVc3djhm
dzRUdDZOeGVPWkNVenlkeHZ0L3lzUgpZVVVCaTZ2ZVVOUkcvb1Z6alVEbgo9YS81SQotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0=
--===============1203161486608988426==--

