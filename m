Content-Type: multipart/mixed; boundary="===============1086936865324890100=="
MIME-Version: 1.0
From: Alan Cox <alan@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Tue, 13 Jun 2017 12:48:14 +0100
Message-ID: <1497354494.5693.1.camel@linux.intel.com>
In-Reply-To: <61e11e67-6c1b-ef1e-5fb8-a7c9efb17666@deltatee.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1086936865324890100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-06-12 at 17:34 -0600, Logan Gunthorpe wrote:
> Hey,
> =

> Ok, I dug into this bug and I know what's going on. Unfortunately,
> it's
> a mess of a couple issues and I don't know what correct the
> solution(s)
> is(are).
> =

> 1) The test we are looking at is overrunning the dynamic char dev
> major
> numbers by a lot. On a successful run, it gets down to 216 where the
> limit is 234. Thus, there are 18 too many major numbers assigned and
> the
> fact that this test used to work is really just luck. (I've cc'd
> developers from 49db08c3 for this issue.)
> =


If you dump the list of majors and drivers do they all look valid or is
there any corruption or repetition that looks odd (wondering if we've
got too many devices or a leak) ?

Alan


--===============1086936865324890100==--

