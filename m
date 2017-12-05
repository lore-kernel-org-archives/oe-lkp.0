Content-Type: multipart/mixed; boundary="===============5340999070766920047=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers@google.com>
To: lkp@lists.01.org
Subject: Re: [LTP] 3239b6f29b ("KEYS: return full count in keyring_read() if buffer is too small"): ltp.keyctl06.fail
Date: Tue, 05 Dec 2017 10:10:47 -0800
Message-ID: <20171205181047.GA66710@google.com>
In-Reply-To: <87a7yxmrwz.fsf@rpws.prws.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5340999070766920047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2017 at 10:43:08AM +0100, Richard Palethorpe wrote:
> =

> We are getting the following result, even with the follow up patch:
> =

> keyctl06.c:68: FAIL: KEYCTL_READ returned 4 but expected 8
> =

> This is with SUSE SLE15 kernel 4.12.14. I haven't had chance to
> investigate it yet.
> =


Does the kernel include *both* fixes the test tests for now?

--===============5340999070766920047==--

