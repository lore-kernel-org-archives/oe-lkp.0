Content-Type: multipart/mixed; boundary="===============1612221818425067139=="
MIME-Version: 1.0
From: Hart, Darren <darren.hart@intel.com>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Fri, 15 Apr 2016 20:05:19 +0000
Message-ID: <606FA888-0FC1-44AA-A7DE-41F4D355D0E1@intel.com>
In-Reply-To: <CAN=P9pj+AQL7ugZ4AcKtXw4bQZsiBUrVAVh0GLFS6Uw6vC=28g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1612221818425067139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

I met with Kostya at Intel Tech Days and he had some compelling arguments f=
or including some of these tests.

Dave H: I took a quick look at Kasan, which appears to require an existing =
config option (CONFIG_KASAN) for dynamic memory access checking using shado=
w memory. Is this something you would like to see added to 0-day? Do we hav=
e anything today which provides comparable coverage?

Combining Kasan and other existing kernel integrity checking, the syzkaller=
 fuzz tester is showing promising results and the reports come in the form =
of kernel oops and similar things which we already check for in 0-day.

For the others on Cc, do you have additional context for or against includi=
ng syzkaller and kasan in 0day?

Fengguang, what are your thoughts on including these in 0-day?

Thanks,

--
Darren Hart
Intel Open Source Technology Center

On 4/12/16, 10:24 PM, "Kostya Serebryany" <kcc(a)google.com<mailto:kcc@go=
ogle.com>> wrote:

CC-ing more people after today's conversation at the Intel Tech Days.

We'd like to add kasan and syzkaller [1,2,3,4] to the 0-day kbuild system.
We believe this has a large potential to find old bugs and prevent regressi=
ons in the Kernel.
How do we achieve this?

Thanks,

--kcc

[1] https://github.com/google/syzkaller
[2] https://github.com/google/syzkaller/wiki/Found-Bugs
[3] https://lwn.net/Articles/677764/
[4] https://www.kernel.org/doc/Documentation/kasan.txt


On Tue, Dec 15, 2015 at 3:49 AM, David Drysdale <drysdale(a)google.com<mail=
to:drysdale@google.com>> wrote:
Hi Fengguang / LKP-folk,

Quick question -- how easy is it to add extra builds/tests/checks to
your marvellous 0-day kbuild system?

The reason I ask is that I've recently been exploring syzkaller [1],
which is a system call fuzzer written by some of my colleagues here at
Google (cc'ed).  Although it's fairly new, it has uncovered a bunch of
kernel bugs already [2] so I wondered if it might be a good candidate
for inclusion in the 0-day checks at some point.

(As an aside, I'm in the process of writing an article about syzkaller
for LWN, which might also expose it to more folk.)

What do you think?

Thanks,
David

[1] https://github.com/google/syzkaller
[2] https://github.com/google/syzkaller/wiki/Found-Bugs


--===============1612221818425067139==--

