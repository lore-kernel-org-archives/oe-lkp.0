Content-Type: multipart/mixed; boundary="===============7863501955596011891=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [mm] 7d5b506f3c2: -3.9% pigz.time.minor_page_faults
Date: Thu, 12 Feb 2015 12:58:03 +1100
Message-ID: <20150212125803.47c19fa4@canb.auug.org.au>
In-Reply-To: <1423704926.5968.117.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7863501955596011891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huang,

On Thu, 12 Feb 2015 09:35:26 +0800 Huang Ying <ying.huang@intel.com> wrot=
e:
>
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 7d5b506f3c295ff81e34235544a9e6ac143743c1 ("mm: incorporate read-on=
ly pages into transparent huge pages")

You may need to be more precise about the tree that you are using as
linux-next rebases every day and so there could be different
interactions with a single commit depending on what else is in a
particular release.  For example, the above commit appears in 4
different linux-next releases so far (next-20150204, next-20150209,
next-20150210, next-20150211).

Also, mm related problems should probably also be reported to Andrew
Morton.

-- =

Cheers,
Stephen Rothwell                    sfr(a)canb.auug.org.au

--===============7863501955596011891==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlUzQWl2QUFvSkVNRFRhOElyN1p3VkRCb1AvaXlZMk5qbWVGcFZLTDErNmpYKzRkdGkK
dmlUeUVCdUF2bk04dW4zb0laYWlKRTZoQnhXYU9YV0Z0MWY1WW1wSjVpaThIMFJRRmJsYjdHOWdv
UnplZDBmQgpqK1V5S1FRV1ZLWm1LSDJCV1hjQ0J3NHJMenN3cE9ZRzcyMGhROVBvQmJSRmN3T0lJ
R0NWSkVPRGYzREdsLy95CkJPMmY3YmlJZTA1Z1RsaVJFb2VjU1lKeUhjYVdNQ2RxdFUxYmdtOUp3
V2pTWG1nekdsa3Q2RGNiM1lBUFNPQ2gKa01oMG94bkR4K2c2NExCelNMci9PK2Z1NkZ4dG9OOCs3
RFRxb1djc05yWnYxdDIySmlENXFlR2lyWElqaWw4WAoyWE5UOEtFS0JxVmdibm5uVU5XOEdWdURl
aVkwNzd5cWprS3c3TXpscTljdk9QblZ6VTM4Tm1icnpoR2s0ZWVjClo2SWVKRlZtc080c2ovdk4y
WVcralAvSTdqZWk4eUQvNXAraUN1MEwvVVg3ZGFUN0pRcVdLUUhNUDhtaXVmczIKejY1MHlCQzNv
SS9uSG5rU00zeDBvbGwzaktnNTdYMUozeXo5Q2FiV2xRUXNLaXQ5RkRKMjN1ZnE3NkYxcU5raAo3
M3o1TXp5OUE3OWZiTTVhc0VWdHdpeHdLM0J6RDlDVXJCWTc3YVc4TFZ3ZnJhV3V2QTJ5bXVrRzZy
eE1FSnpsClhCNzczNldmTjhZRjJhYnZFY2l1WXVrZnNzdGRmTmNVV1NqQUx2Ti96R0tjcVVwSVll
NG1ZekNQQ3J3YlI5YjcKYmNJWU5IVGpJRWttUWZrODhCaDVCdlBQdnVHU05RVDZoSjZNR0RTc1cv
OE4zK29EVDRXSkZnR2k5TEZ2RktwZwpYTk1ubk04WTc3SU1BbGYvdnZYdAo9Z245egotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============7863501955596011891==--

