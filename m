Content-Type: multipart/mixed; boundary="===============6886959287633035220=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [gup] 17839856fd: stress-ng.vm-splice.ops_per_sec 2158.6% improvement
Date: Thu, 11 Jun 2020 13:24:09 -0700
Message-ID: <CAHk-=whCjhBgJv0z6JoOKMyfnBp0WhH6oa=ayuRRLtgJxOkd5Q@mail.gmail.com>
In-Reply-To: <20200611040453.GK12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6886959287633035220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 9:05 PM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> FYI, we noticed a 2158.6% improvement of stress-ng.vm-splice.ops_per_sec =
due to commit:
>
> commit: 17839856fd588f4ab6b789f482ed3ffd7c403e1f ("gup: document and work=
 around "COW can break either way" issue")

Well, that is amusing, and seeing improvements is always nice, but
somehow I think the test is broken.

I can't see why you'd ever see an improvement from that commit, and if
you do see one, not one by a factor of 20x.

> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> | testcase: change | stress-ng: stress-ng.vm-splice.ops_per_sec 372.8% im=
provement        |
> | testcase: change | stress-ng: stress-ng.vm-splice.ops_per_sec 2052.7% i=
mprovement       |

Ok, so it's affecting other runs of the same test, and the smaller
("only" 378%) improvement seems to be just from using fewer threads.

So maybe forcing the COW ends up avoiding some very specific cache
thrashing case.

> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

Is there some place where you'd actually _see_ what
"stress-ng.vm-splice.ops_per_sec" actually means and does?

Yeah, I can go and find the actual stress-ng git repo, and take a
look. I kind of did. But the step from your "to reproduce" to actually
figuring out what is going on is pretty big.

It would be nice to know what it actually does - do you have a
database of descriptions for the different tests and how to run them
individually or anything like that?

IOW, rather than the above "just run all fo the lkp scripts",
something like how to run the actual individual test would be good.

IOW how do those yaml files translate into _actually_ running the
'stress-ng' program?

                Linus
--===============6886959287633035220==--

