Content-Type: multipart/mixed; boundary="===============0077428213246999053=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 14:10:46 +0100
Message-ID: <alpine.DEB.2.20.1703091409080.3521@nanos>
In-Reply-To: <58C152F1.9090004@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0077428213246999053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Mar 2017, Daniel Borkmann wrote:
> With regard to CPA_FLUSHTLB that Linus mentioned, when I investigated
> code paths in change_page_attr_set_clr(), I did see that CPA_FLUSHTLB
> was set each time we switched attrs and a cpa_flush_range() was
> performed (with the correct number of pages and cache set to 0). That
> would be a __flush_tlb_all() eventually.
> =

> Hmm, it indeed might seem likely that this could be an emulation bug.

Which variant of __flush_tlb_all() is used when the test fails?

Check for the following flags in /proc/cpuinfo: pge invpcid

Thanks,

	tglx

--===============0077428213246999053==--

