Content-Type: multipart/mixed; boundary="===============2147382323606655692=="
MIME-Version: 1.0
From: Felipe Balbi <balbi@ti.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] usb: gadget: forbid queuing request to a disabled ep
Date: Wed, 16 Dec 2015 10:52:10 -0600
Message-ID: <87h9jifi9x.fsf@saruman.tx.rr.com>
In-Reply-To: <0C18FE92A7765D4EB9EE5D38D86A563A01DF62CC@SHSMSX103.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2147382323606655692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

"Du, Changbin" <changbin.du@intel.com> writes:
>> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
>> index 3d583a1..b566a4b 100644
>> --- a/include/linux/usb/gadget.h
>> +++ b/include/linux/usb/gadget.h
>> @@ -402,6 +402,9 @@ static inline void usb_ep_free_request(struct usb_ep
>> *ep,
>>  static inline int usb_ep_queue(struct usb_ep *ep,
>>  			       struct usb_request *req, gfp_t gfp_flags)
>>  {
>> +	if (WARN_ON_ONCE(!ep->enabled))
>> +		return -ESHUTDOWN;
>> +
>>  	return ep->ops->queue(ep, req, gfp_flags);
>>  }
>> =

>> --
>> 2.5.0
>
> With this patch, ep0 transfer breaks. it because the 'enabled' of ep0
> is not set. Ep0 is not enabled by usb_ep_enable, but in UDC driver. So
> there need another patch to set ep0's flag also.

yeah, we don't like regressions :-) So the fix should come before
$subject to avoid a regression.

-- =

balbi

--===============2147382323606655692==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSldjWmE3QUFvSkVJYU9zdUExeXFSRVNvNFAvamVZSXJ4QkQrL01lZ2JjQU80c3Y0T0YK
RUx2aEJkY29zQTFTTDh3YXdCWUxwKzd3YVVlL2FWZmpURlI1WUozbUtzR2cva21SSm84RUxmNWtQ
NXpWT0ZFQwp4QWlxOWxCZjZVRUYxZGt3N1huTlZDZjErTStjUkY2RnlVV0hxRDFFTmpmMFFiKzRM
TkNRRTMzRi9xSE1aYTRNCmZuYWxmaTA0amJzUEEyM3lMQmFMbE54TzVuN3d2UUhTSTRjdlZlUzAx
Q0NnOHRJRXJBaGI3bENJS2V5RFN3QUwKWXhxazBNdkpldHNhOW9ib2FRMkZxek04dklJc2ZWbk94
U00wdHQvbEt2SUE2TlJPZ0FJTGtnN1ZYQ3R2Y1llbAo3TEtRM25wZEpYZXdxMWUwRk03cmk5OGhK
RXRKS05BRFpmd215NERyU0J6em41WVhoV1hoQlZIS0gzbDV1aXozClh0WDVITFNERkZvVFlNMy9w
aWJpTFlkZHlPd29KNXIyRWhtK2JxSkIrNVpXVFpEalFoeXZYWUozcmFTUUdwakMKZ240R1czNWJQ
ZnJRWDdpUDNDRlRkOWtrU1dScm1NM2kzYVVIWFUvNVkrTVhtczZwMU9ock03VCttRGkwR1FlZApI
c0M1U1pFcjh2ckxPNGpuMjRPVCtQZXBEcUwwMUxQQzJiMllvaXNyQ1p2Ty9JMDJRNlJ1TkczdnJs
TTE0VVlRCnJnM25ic1lPK2xacUVyaG5NWWhnS0ZYc0NveG1ndkRGWnBqeFFPSDFmVFZpMjJsN1VL
L291cUpJNW10T01PRGIKVlhGR0xOM0QwTUEvRHMzQzIxTlBBYnRPZk1GckFPa2hXdWVSUUYrS1FL
RUdNQjh5VG1XSThJaFozUG9wOTJncgpEVnFGcm11dnBzTnVCU0ZyNHBRMwo9MkZCdgotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0=
--===============2147382323606655692==--

