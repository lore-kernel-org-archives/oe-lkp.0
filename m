Content-Type: multipart/mixed; boundary="===============7401163773278878971=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 07:03:00 +0200
Message-ID: <20160815050300.GA16267@gmail.com>
In-Reply-To: <CA+55aFxbLsD_btd0qXpuxTqAB5OQF1O+v7-OMgj8ftBE4Qd7WA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7401163773278878971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Make sure you actually use "perf record -e cycles:pp" or something
> that uses PEBS to get real profiles using CPU performance counters.

Btw., 'perf record -e cycles:pp' is the default now for modern versions
of perf tooling (on most x86 systems) - if you do 'perf record' it will
just use the most precise profiling mode available on that particular
CPU model.

If unsure you can check the event that was used, via:

  triton:~> perf report --stdio 2>&1 | grep '# Samples'
  # Samples: 27K of event 'cycles:pp'

Thanks,

	Ingo

--===============7401163773278878971==--

