Content-Type: multipart/mixed; boundary="===============4030410544949475522=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Thu, 20 Sep 2018 18:11:32 +0200
Message-ID: <CAAeHK+zViCbxm6YSu3zi3zN5UnS6HXZ1H0vKyB6nxhz2PiDsTw@mail.gmail.com>
In-Reply-To: <a1533cac-372f-5c21-3e32-21f6f32d800f@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4030410544949475522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2018 at 2:47 AM, Rong Chen <rong.a.chen@intel.com> wrote:
> Could you help to compare the 0day-ci repo
> (https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-us=
er-pointers-passed-to-the-kernel/20180831-042151)
> with your repo if there's no problem on your repo? btw, 0day robot merged
> the patchset based on v4.19-rc1, is this right?

The repos are almost identical, 0day one has a few more commits than
the one that I have, but I doubt that would affect anything. Yes,
4.19-rc1.

Honestly I feel hesitant to run some script I don't understand on my
machine. Can I reproduce this somehow within a booted QEMU with kernel
that includes this patchset?

I'm going to send another version of this patchset soon, would it be
ok to wait until then and see of the 0day bot reports the same issue
against that one?

--===============4030410544949475522==--

