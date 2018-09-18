Content-Type: multipart/mixed; boundary="===============3165206179166504008=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Tue, 18 Sep 2018 17:49:56 +0200
Message-ID: <CAAeHK+zD9zDTaFnRDkDvtGy4pVuKH09vx5YWy-EqsMQeihx0-g@mail.gmail.com>
In-Reply-To: <ef6d291d-7fc9-d53f-eb81-99605e9a2886@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3165206179166504008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2018 at 10:57 AM, Rong Chen <rong.a.chen@intel.com> wrote:
>
>
> On 09/13/2018 09:00 AM, Rong Chen wrote:
>
>
>
> On 09/12/2018 07:41 PM, Andrey Konovalov wrote:
>
> That commit only adds noop annotations, so this is most likely a false
> positive. I also can't make anything out of the error log you
> provided.
>
> The issue is that the binary paths become garbled from this commit,
> and it can be reproduced on 0day-ci tree in high probability,
> It's possible that the commit is influenced by other merged commits.
> Could you confirm it on your own tree if you have time?
>
> Hi Andrey,
>
> Any update on this?
>
>
> Best Regards,
> Rong Chen

Hi Rong,

I'll take a look this week.

Do I understand correctly that I need to run the repro with my
patchset and without and check whether it differs?

Thanks!

--===============3165206179166504008==--

