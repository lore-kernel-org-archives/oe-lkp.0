Content-Type: multipart/mixed; boundary="===============0553054570438634827=="
MIME-Version: 1.0
From: Benjamin LaHaise <bcrl@kvack.org>
To: lkp@lists.01.org
Subject: Re: [aio] e52ddd946a: xfstests generic/211 fail
Date: Sat, 22 Mar 2014 21:03:21 -0400
Message-ID: <20140323010321.GC4173@kvack.org>
In-Reply-To: <20140323005833.GA14807@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0553054570438634827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 23, 2014 at 08:58:33AM +0800, Fengguang Wu wrote:
>     @@ -1,2 +1,2 @@
>      QA output created by 211
>     -aio-free-ring-with-bogus-nr-pages: Success!
>     +aio-free-ring-with-bogus-nr-pages: Error: io_setup returned -11, exp=
ected -ENOMEM

This isn't anything serious, as it is just a change in the error code being =

reported.  I'll look into this on Monday.

		-ben
-- =

"Thought is the essence of where you are now."

--===============0553054570438634827==--

