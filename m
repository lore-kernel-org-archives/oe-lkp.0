Content-Type: multipart/mixed; boundary="===============9092722253880730370=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [clockevents] d5a085970b0: -9.2% will-it-scale.per_thread_ops
Date: Thu, 26 Jun 2014 12:39:21 +0800
Message-ID: <20140626043921.GC17188@localhost>
In-Reply-To: <CAKohpomKX69qLMgUBJpi1H-mxtkqSDCDn4J5V65+n03Lj1iOsQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9092722253880730370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2014 at 09:35:11AM +0530, Viresh Kumar wrote:
> On 26 June 2014 07:16, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > I'm not sure how the simple commit will impact will-it-scale/pwrite2
> > throughput. Just in case you can see more clues.
> >
> > git://git.linaro.org/people/vireshk/linux tick/ONESHOT-STOPPED
> > commit d5a085970b0b88b8c82303d2c45f09c9427fd02a ("clockevents: x86: add=
 support for ONESHOT_STOPPED mode")
> >
> > test case: nhm4/will-it-scale/pwrite2
> =

> What is this test all about ?

It calls the pwrite2() syscall in parallel, on one single tmpfs file.

https://github.com/antonblanchard/will-it-scale.git

Thanks,
Fengguang

--===============9092722253880730370==
Content-Type: text/x-csrc
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="pwrite2.c"

I2RlZmluZSBfWE9QRU5fU09VUkNFIDUwMAojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHN0
ZGxpYi5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUg
PGFzc2VydC5oPgoKI2RlZmluZSBCVUZMRU4gNDA5NgoKc3RhdGljIGNoYXIgdG1wZmlsZVtdID0g
Ii90bXAvd2lsbGl0c2NhbGUuWFhYWFhYIjsKCmNoYXIgKnRlc3RjYXNlX2Rlc2NyaXB0aW9uID0g
IlNhbWUgZmlsZSBwd3JpdGUiOwoKdm9pZCB0ZXN0Y2FzZV9wcmVwYXJlKHZvaWQpCnsKCWNoYXIg
YnVmW0JVRkxFTl07CglpbnQgZmQgPSBta3N0ZW1wKHRtcGZpbGUpOwoKCW1lbXNldChidWYsIDAs
IHNpemVvZihidWYpKTsKCWFzc2VydChmZCA+PSAwKTsKCWFzc2VydCh3cml0ZShmZCwgYnVmLCBz
aXplb2YoYnVmKSkgPT0gc2l6ZW9mKGJ1ZikpOwoJY2xvc2UoZmQpOwp9Cgp2b2lkIHRlc3RjYXNl
KHVuc2lnbmVkIGxvbmcgbG9uZyAqaXRlcmF0aW9ucykKewoJY2hhciBidWZbQlVGTEVOXTsKCWlu
dCBmZCA9IG9wZW4odG1wZmlsZSwgT19SRFdSKTsKCglhc3NlcnQoZmQgPj0gMCk7CgoJd2hpbGUg
KDEpIHsKCQlhc3NlcnQocHdyaXRlKGZkLCBidWYsIEJVRkxFTiwgMCkgPT0gQlVGTEVOKTsKCgkJ
KCppdGVyYXRpb25zKSsrOwoJfQp9Cgp2b2lkIHRlc3RjYXNlX2NsZWFudXAodm9pZCkKewoJdW5s
aW5rKHRtcGZpbGUpOwp9Cg==

--===============9092722253880730370==--

