Content-Type: multipart/mixed; boundary="===============4624663815984949723=="
MIME-Version: 1.0
From: Felipe Balbi <balbi@ti.com>
To: lkp@lists.01.org
Subject: Re: [usb] 22bf2bb019: WARNING: CPU: 0 PID: 0 at include/linux/usb/gadget.h:405 composite_ep0_queue+0xad/0xd0()
Date: Mon, 14 Dec 2015 10:25:27 -0600
Message-ID: <8737v5hua0.fsf@saruman.tx.rr.com>
In-Reply-To: <87oadt4dhc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4624663815984949723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

kernel test robot <ying.huang@linux.intel.com> writes:
> FYI, we noticed the below changes on
>
> https://github.com/0day-ci/linux changbin-du-intel-com/usb-gadget-forbid-=
queuing-request-to-a-disabled-ep/20151214-115939
> commit 22bf2bb019c7f92cda32c46b95715b0b208052d0 ("usb: gadget: forbid
> queuing request to a disabled ep")

great, seems like that patch found a bug on dummy_hcd

-- =

balbi

--===============4624663815984949723==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSldidTEzQUFvSkVJYU9zdUExeXFSRWpVY1AvMkEwQTZXc1J5dmZydnRNemRQUzB5VUsK
a1hRVUNyMFBSYzcyU2M4Sksyc2ZsOFFVdHZER3JQNVg4MStRL2wzK1JMZ01HL0JSb05PdGhaeUhZ
RmhRdjFMNwpvWFAwZWlleHYrbjU0SjRvZVpmQ2ZQS2tXT2pLZ3JaM0FwdVhmTnlPUC9hdFdWOC90
SEcxNXBQYkRlZm9Rck8wCjROMW9QYW5rTllDYUFZSDNyTEJZMitCL0FPYms5bTlBWk8zaTNLcmpn
R1VZUkxmQWMvMjA1TnhTam5GZVVNRWcKZHBhdDZqNXJpZnAvaU5UQnRuZStJeUc4cGZGbHRndmdI
bFVlbkp6alRGMFl1TnNrT3JWM1NTZUtlWE40WmhoZwpraDJMdks3Um8wVUxmVVJVeWRMQ2sxb2VQ
eWwrS0xwNGRDWlVQTng3Y2hTMlQwSHVqRnJINHhNRXpZaS9RMk1vCjlZdHJ1NXk4bnN5MXMrZkg4
cDlnUFRUTURqVFlxcUFXOWdRSlI5V3RZd0RFWFlWQ1BoRFg1Z2xRYm0xMTFMUWYKb3JRNjJuK0pD
ektJTzJZS3ZBQjd4bkZqc0ZySjAvSVBvUWNCbkZJTktWeldYWGZkNXlGNFcyYkxTWFY1cEd0NQpO
eE9ZVnl2MG5UdlhHN3grd01MMDlJVVNGMG1IKytpQjh0MXJsZ25vL2FxMitOenB6RTRTUDNqaTBE
R3BRQTltCk14cVpaYlk1VTlpTnZXMnlQdHFBdnFRaEVzMWM0aXR3VEJEU3FFc2JqekNMaW9WZlBo
Q3pRRk1va3RBa1dsYTAKSlRuYjlEeTYzci9qYzFTeExzQjk2Y1FSN2dVQk05a3ROMlhuVTRzVDBL
QTZOVDlFd3dYL2ZmRlBiQU4ydVFHdwpjYnRYVDhVWm1ZcG9hVDlDdElsago9SkZvQgotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0=
--===============4624663815984949723==--

