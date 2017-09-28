Content-Type: multipart/mixed; boundary="===============6221201297285960182=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] f5caf621ee: PANIC:double_fault
Date: Thu, 28 Sep 2017 13:49:52 +0200
Message-ID: <20170928114952.7m7zr4zr6i5d56ko@hirez.programming.kicks-ass.net>
In-Reply-To: <20170928084941.ygmvb6qfn3otfvac@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6221201297285960182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 10:49:41AM +0200, Ingo Molnar wrote:
> > Sure, but its still an officially supported GCC version. So either it
> > must be made to work, or we must update the minimal GCC version
> > requirements for the kernel.
> =

> Of course! I just mean I'd not be surprised if this was a GCC bug/quirk
> with legacy GCC versions that probably won't be fixed.

Ah, I recently had a case where this old GCC-4.4 crashed on 'obviously'
broken code while newer GCC's somehow made it 'work'.

--===============6221201297285960182==--

