Content-Type: multipart/mixed; boundary="===============7283891525427271126=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: a13c600e15 ("x86/mm/pti: Move user W+X check into .."): WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:283 note_page
Date: Fri, 10 Aug 2018 09:30:16 +0200
Message-ID: <20180810073016.fn7wrkkdm5p7zv53@suse.de>
In-Reply-To: <5b6cc146.lVmfvLKHKgZxC5d8%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7283891525427271126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2018 at 06:33:42AM +0800, kernel test robot wrote:
> [    9.635329] x86/mm: Checking user space page tables
> [    9.636271] ------------[ cut here ]------------
> [    9.637045] x86/mm: Found insecure W+X mapping at address (ptrval)/0xf=
fc01000
> [    9.638228] WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:28=
3 note_page+0x66b/0x870

Hmm, weird, this warning triggers for 32-bit non-pae. There is no
NX-bit in this mode, so the check shouldn't happen there. I'll
investigate.


	Joerg


--===============7283891525427271126==--

