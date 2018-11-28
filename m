Content-Type: multipart/mixed; boundary="===============4686678988615421758=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 28 Nov 2018 15:10:04 -0800
Message-ID: <alpine.DEB.2.21.1811281504030.231719@chino.kir.corp.google.com>
In-Reply-To: <CAHk-=wjgRO-=NPaU9EmrdC3it3o7kvf4u7sewv3crtNLkE13Hg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4686678988615421758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Nov 2018, Linus Torvalds wrote:

> On Tue, Nov 27, 2018 at 7:20 PM Huang, Ying <ying.huang@intel.com> wrot=
e:
> >
> > From the above data, for the parent commit 3 processes exited within
> > 14s, another 3 exited within 100s.  For this commit, the first process
> > exited at 203s.  That is, this commit makes memory allocation more fair
> > among processes, so that processes proceeded at more similar speed.  But
> > this raises system memory footprint too, so triggered much more swap,
> > thus lower benchmark score.
> >
> > In general, memory allocation fairness among processes should be a good
> > thing.  So I think the report should have been a "performance
> > improvement" instead of "performance regression".
> =

> Hey, when you put it that way...
> =

> Let's ignore this issue for now, and see if it shows up in some real
> workload and people complain.
> =


Well, I originally complained[*] when the change was first proposed and =

when the stable backports were proposed[**].  On a fragmented host, the =

change itself showed a 13.9% access latency regression on Haswell and up =

to 40% allocation latency regression.  This is more substantial on Naples =

and Rome.  I also measured similar numbers to this for Haswell.

We are particularly hit hard by this because we have libraries that remap =

the text segment of binaries to hugepages; hugetlbfs is not widely used so =

this normally falls back to transparent hugepages.  We mmap(), =

madvise(MADV_HUGEPAGE), memcpy(), mremap().  We fully accept the latency =

to do this when the binary starts because the access latency at runtime is =

so much better.

With this change, however, we have no userspace workaround other than =

mbind() to prefer the local node.  On all of our platforms, native sized =

pages are always a win over remote hugepages and it leaves open the =

opportunity that we collapse memory into hugepages later by khugepaged if =

fragmentation is the issue.  mbind() is not viable if the local node is =

saturated, we are ok with falling back to remote pages of the native page =

size when the local node is oom; this would result in an oom kill if we =

used it to retain the old behavior.

Given this severe access and allocation latency regression, we must revert =

this patch in our own kernel, there is simply no path forward without =

doing so.

[*] https://marc.info/?l=3Dlinux-kernel&m=3D153868420126775
[**] https://marc.info/?l=3Dlinux-kernel&m=3D154269994800842

--===============4686678988615421758==--

