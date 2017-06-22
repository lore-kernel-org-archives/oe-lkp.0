Content-Type: multipart/mixed; boundary="===============1886832922808713748=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Thu, 22 Jun 2017 22:51:15 +0200
Message-ID: <20170622205115.GA4938@redhat.com>
In-Reply-To: <alpine.LSU.2.11.1706221042550.20265@eggly.anvils>
List-Id: <oe-lkp.lists.linux.dev>

--===============1886832922808713748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/22, Hugh Dickins wrote:
>
> On Thu, 22 Jun 2017, Oleg Nesterov wrote:
> >
> > Something like the patch below? Yes, I thought about this too.
>
> Yes, that patch (times 11 for all the architectures)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Yes, yes, this is clear to me. But only after you have already explained
this in your previous email ;)

> But my own preference this morning is to do nothing, until we hear
> more complaints and can classify them as genuine userspace breakage,
> as opposed to testcases surprised by a new kernel implementation.

OK. Agreed. Lets wait for the "real" bug report.

FYI. I am still investigating that redhat internal bug report. And yes,
it was the real application. But. I still think that it fails by another
reason, just the test-case they provided doesn't match the reality and
it hits another (this) problem by accident.

Oleg.


--===============1886832922808713748==--

