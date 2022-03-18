Content-Type: multipart/mixed; boundary="===============7070431210412016639=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 17:45:41 -0700
Message-ID: <d4f62008-faa7-2931-5690-f29f9544b81b@intel.com>
In-Reply-To: <A185DAD5-3AA7-445B-B57D-AFAF6B55D144@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7070431210412016639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/22 17:20, Nadav Amit wrote:
> I don=E2=80=99t have other data right now. Let me run some measurements l=
ater
> tonight. I understand your explanation, but I still do not see how
> much =E2=80=9Clater=E2=80=9D can the lazy check be that it really matters=
. Just
> strange.

These will-it-scale tests are really brutal.  They're usually sitting in
really tight kernel entry/exit loops.  Everything is pounding on kernel
locks and bouncing cachelines around like crazy.  It might only be a few
thousand cycles between two successive kernel entries.

Things like the call_single_queue cacheline have to be dragged from
other CPUs *and* there are locks that you can spin on.  While a thread
is doing all this spinning, it is forcing more and more threads into the
lazy TLB state.  The longer you spin, the more threads have entered the
kernel, contended on the mmap_lock and gone idle.

Is it really surprising that a loop that can take hundreds of locks can
take a long time?

                for_each_cpu(cpu, cfd->cpumask) {
                        csd_lock(csd);
			...
		}
--===============7070431210412016639==--

