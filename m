Content-Type: multipart/mixed; boundary="===============7796854595882009238=="
MIME-Version: 1.0
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Wed, 25 Oct 2017 16:50:48 -0400
Message-ID: <c5082661-99a4-1b11-c8a1-8b31e9ab8d95@oracle.com>
In-Reply-To: <20171024024439.u3ywfgvi67fe4mbg@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7796854595882009238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/23/2017 10:44 PM, Fengguang Wu wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit ce56a86e2ade45d052b3228cdfebe913a1ae7381
> Author:     Craig Bergstrom <craigb@google.com>
> AuthorDate: Thu Oct 19 13:28:56 2017 -0600
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Fri Oct 20 09:48:00 2017 +0200
>
>      x86/mm: Limit mmap() of /dev/mem to valid physical addresses

Also note
https://lists.xenproject.org/archives/html/xen-devel/2017-10/msg02935.html

-boris

--===============7796854595882009238==--

