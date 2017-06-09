Content-Type: multipart/mixed; boundary="===============6330795957679556905=="
MIME-Version: 1.0
From: Paolo Abeni <pabeni@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [udp] bc0d3d0639: apachebench.requests_per_second -21% regression
Date: Fri, 09 Jun 2017 17:35:29 +0200
Message-ID: <1497022529.3416.16.camel@redhat.com>
In-Reply-To: <1496871606.2593.2.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6330795957679556905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-06-07 at 23:40 +0200, Paolo Abeni wrote:
> I tried to measure the regression using the Apache benchmarking tool
> directly with:
> =

> ab -t 300 -c 1000 -n 1000000 -q -k http://127.0.0.1/
> =

> and, across the named patches I see no relevant differences, and =

> (oddly enough) some measurable improvement=C2=A0vs the vanilla linux-net.
> Can the measured regression be caused by some fuzz in the test
> environment, like the test being run on different HW?

I did a lot of run of the ab test tool, on both vanilla and patched
kernel and I measured a variance well above 21% and a very similar
distribution for both vanilla and patched kernel. I'm really thinking
this is a test-suite artifact.

How do you a get stable baseline?

Thank you,

Paolo

--===============6330795957679556905==--

