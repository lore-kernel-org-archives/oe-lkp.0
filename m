Content-Type: multipart/mixed; boundary="===============3693135890470777457=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [iversion] c0cef30e4f: aim7.jobs-per-min -18.0% regression
Date: Thu, 15 Mar 2018 10:46:45 -0700
Message-ID: <CA+55aFypsiFknaNaWQP8rRacNiZLW8sEfU150L0uHF_t8=-3UA@mail.gmail.com>
In-Reply-To: <1078e19a-3393-7cd9-3b1f-fae6cf0281d3@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3693135890470777457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2018 at 12:33 AM, kemi <kemi.wang@intel.com> wrote:
> Hi, Jeff
>    Today, I deleted the previous kernel images for commit 3da90b159b14667=
2f830bcd2489dd3a1f4e9e089
> and commit c0cef30e4ff0dc025f4a1660b8f0ba43ed58426e, respectively. And, r=
e-run the same aim7
> jobs for three times for each commit. The aim7 score between two commit d=
oes not have obvious difference.
>
> Perhaps something weird happen when compiling kernel. Please ignore this =
report, apologize for the bother.

Ok, I'm not entirely happy with how random this was, but that commit
never looked like a remotely likely culprit, so I think we'll just
chalk it up to bad luck and unknown effects.

                Linus

--===============3693135890470777457==--

