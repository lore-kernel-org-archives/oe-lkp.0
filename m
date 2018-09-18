Content-Type: multipart/mixed; boundary="===============1138811802497274427=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 15:14:11 +0800
Message-ID: <1dac87f5-fa47-eaf2-ef34-945365e0b2c3@intel.com>
In-Reply-To: <7969.1537252241@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1138811802497274427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/18/2018 02:30 PM, David Howells wrote:
> Rong Chen <rong.a.chen@intel.com> wrote:
>
>> Attach please find the new kconfig, you could try again.
> I tried that again - it still comes to the login prompt and doesn't do
> anything that I can tell.
>
It'smy fault, I'm awfully sorry, please clone the latest code from =

https://github.com/intel/lkp-tests.git

Best Regards,
Rong Chen



--===============1138811802497274427==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAwOS8xOC8yMDE4IDAyOjMwIFBNLCBE
YXZpZCBIb3dlbGxzCiAgICAgIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjc5NjkuMTUzNzI1MjI0MUB3YXJ0aG9nLnByb2N5
b24ub3JnLnVrIj4KICAgICAgPHByZSB3cmFwPSIiPlJvbmcgQ2hlbiA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cm9uZy5hLmNoZW5AaW50ZWwuY29tIj4mbHQ7
cm9uZy5hLmNoZW5AaW50ZWwuY29tJmd0OzwvYT4gd3JvdGU6Cgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPkF0dGFjaCBwbGVhc2UgZmlu
ZCB0aGUgbmV3IGtjb25maWcsIHlvdSBjb3VsZCB0cnkgYWdhaW4uCjwvcHJlPgogICAgICA8L2Js
b2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0iIj4KSSB0cmllZCB0aGF0IGFnYWluIC0gaXQgc3Rp
bGwgY29tZXMgdG8gdGhlIGxvZ2luIHByb21wdCBhbmQgZG9lc24ndCBkbwphbnl0aGluZyB0aGF0
IEkgY2FuIHRlbGwuCgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxzcGFuIGlkPSJ3XzQw
NCIgY2xhc3M9IiI+SXQ8L3NwYW4+PHNwYW4gaWQ9IndfNDA1IiBjbGFzcz0iIj4nczwvc3Bhbj48
c3BhbgogICAgICBpZD0id180MDYiIGNsYXNzPSIiPiA8L3NwYW4+PHNwYW4gaWQ9IndfNDA3IiBj
bGFzcz0iIj5teSA8L3NwYW4+PHNwYW4KICAgICAgaWQ9IndfNDA4IiBjbGFzcz0iIj5mYXVsdDwv
c3Bhbj48c3BhbiBpZD0id180MDkiIGNsYXNzPSIiPiwgPC9zcGFuPjxzcGFuCiAgICAgIGlkPSJ3
XzQwNCIgY2xhc3M9IiI+PHNwYW4gaWQ9IndfNDA5IiBjbGFzcz0iIj4gPC9zcGFuPjxzcGFuCiAg
ICAgICAgaWQ9IndfNDEwIiBjbGFzcz0iIj5JPC9zcGFuPjxzcGFuIGlkPSJ3XzQxMSIgY2xhc3M9
IiI+J20gPC9zcGFuPjxzcGFuCiAgICAgICAgaWQ9IndfNDEyIiBjbGFzcz0iIj5hd2Z1bGx5IDwv
c3Bhbj48c3BhbiBpZD0id180MTMiIGNsYXNzPSIiPnNvcnJ5PC9zcGFuPjxzcGFuCiAgICAgICAg
aWQ9IndfNDE0IiBjbGFzcz0iIj4sIDwvc3Bhbj5wbGVhc2UgY2xvbmUgdGhlIGxhdGVzdCBjb2Rl
IGZyb20KICAgIDwvc3Bhbj48YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IgogICAgICBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzLmdpdCI+aHR0cHM6Ly9naXRo
dWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+PGJyPgogICAgPGJyPgogICAgQmVzdCBSZWdh
cmRzLDxicj4KICAgIFJvbmcgQ2hlbjxicj4KICAgIDxzcGFuIGlkPSJ3XzQwNSIgY2xhc3M9IiI+
PC9zcGFuPjxzcGFuIGlkPSJ3XzQwNiIgY2xhc3M9IiI+PC9zcGFuPjxzcGFuCiAgICAgIGlkPSJ3
XzQwNyIgY2xhc3M9IiI+PC9zcGFuPjxzcGFuIGlkPSJ3XzQwOCIgY2xhc3M9IiI+PC9zcGFuPjxz
cGFuCiAgICAgIGlkPSJ3XzQwOSIgY2xhc3M9IiI+PC9zcGFuPjxicj4KICAgIDxicj4KICA8L2Jv
ZHk+CjwvaHRtbD4K

--===============1138811802497274427==--

