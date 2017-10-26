Content-Type: multipart/mixed; boundary="===============8449657906496927303=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 18:39:11 +0200
Message-ID: <20171026163911.dnovh4zaik5qumtt@gmail.com>
In-Reply-To: <CAOJUGye8nXL-J9oArLLMFz-RPRdKFe6EgqtYPSr5kcWoH2EodQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8449657906496927303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Craig Bergstrom <craigb@google.com> wrote:

> Yes, not much time left for 4.14, it might be reasonable to pull the
> change out since it's causing problems. [...]

Ok, I'll queue up a revert tomorrow morning and send it to Linus ASAP if th=
ere's =

no good fix by then. In hindsight I should have queued it for v4.15 ...

Thanks,

	Ingo

--===============8449657906496927303==--

