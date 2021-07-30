Content-Type: multipart/mixed; boundary="===============1824908738152452895=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 0day bot testing my linux repo
Date: Fri, 30 Jul 2021 08:26:37 +0800
Message-ID: <20210730002637.GA1134228@pl-dbox>
In-Reply-To: <CAEf4BzZBSYn4-aLezaiGt34-fmnBPLDx3NtnJgL7c1quwdrb=Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1824908738152452895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 11:56:55AM -0700, Andrii Nakryiko wrote:
> Hi,
> =

> My name is Andrii Nakryiko and I'm bpf/bpf-next co-maintainer. Would
> it be possible to make 0day bot to test my private linux repo at
> https://git.kernel.org/pub/scm/linux/kernel/git/andrii/bpf-next.git?
Hi Andrii, yes, we are glad to. This repo actually is already in our
regular monitoring, but it doesn't have build summary notifcation and
we will configure this right now. So far, 0-day ci sends out bisected
report to show the commit that introduces problem when any issue is found
on the repo.

> That way I can test major features on multiple architectures I don't
> have direct access to before I post them upstream.
> =

> Please let me know how I can proceed with this. Thank you!
> =

> -- Andrii
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============1824908738152452895==--

