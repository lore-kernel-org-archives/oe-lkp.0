Content-Type: multipart/mixed; boundary="===============7646125507670861164=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 2f47e7e19f ("x86/mm/kaiser: Use PCID feature to make user and .."): WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_ioremap
Date: Mon, 27 Nov 2017 17:22:02 -0800
Message-ID: <9f73a515-ce07-c833-4e6b-2062fe03f354@linux.intel.com>
In-Reply-To: <CAJZ5v0hyAt1cPj3jpm9njOZAo02WmN-83ozeyvDF5qipBXqH=Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7646125507670861164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think I narrowed this down.

__native_flush_tlb_single() depends on cpu_tlbstate.loaded_mm_asid
matching what is in CR3.  But, while we are still "early" in boot, CR3
has hardware ASID=3D0, but cpu_tlbstate.loaded_mm_asid=3D0 which is actually
hardware ASID=3D1.

So, we have ASID=3D0 in CR3 and we try to *flush* ASID=3D1 with INVPCID,
which does nothing for us, effectively missing the TLB flush.

I think we need to steer __native_flush_tlb_single() into the
"!this_cpu_has(X86_FEATURE_INVPCID_SINGLE)" path if we get called before
initialize_tlbstate_and_flush() gives us a "real" ASID in CR3, but I
haven't found a nice way to do it, yet.

We probably also need a debugging warning in there to read CR3 and check
it against cpu_tlbstate.loaded_mm_asid.  I'll look at this in some more
detail tomorrow if nobody beats me to it.

--===============7646125507670861164==--

