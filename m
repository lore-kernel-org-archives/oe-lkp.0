Content-Type: multipart/mixed; boundary="===============4962985675749286233=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Wed, 12 Sep 2018 13:41:51 +0200
Message-ID: <CAAeHK+xZ-b3KQhNA5Lp5gvFOjLQ-kq-jVOTw6tjLRJu_Y+ar3g@mail.gmail.com>
In-Reply-To: <01dd872d-eb7e-001a-9bb1-45025aa3c693@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4962985675749286233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That commit only adds noop annotations, so this is most likely a false
positive. I also can't make anything out of the error log you
provided.

On Wed, Sep 12, 2018 at 3:12 AM, Rong Chen <rong.a.chen@intel.com> wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit 7b5b51e7b3a988741f7f34d5148f1f4fea86434a ("arm64: annotate user
> pointers casts detected by sparse")
>
> https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-use=
r-pointers-passed-to-the-kernel/20180831-042151
>
>
> in testcase: all tests
>
> caused below changes (please refer to attached stderr/dmesg.xz for entire
> log/backtrace):
>
>   No such file or directory
>  : No such file or directory
>  : No such file or directory
> : : No such file or directory
> : : No such file or directory
> : =CF=AA: No such file or directory
> : : No such file or directory
> : invalid date =E2=80=98=E2=80=99
> =C9=95: 0: Can't open =C9=95
> : 0: Can't open
> : syntax error
> : : failed to set up loop device: No such file or directory
> : cannot stat '': No such file or directory
> 8: missing or unknown command
> n<: /dev/n<: failed to set up loop device: No such file or directory
> : cannot remove ''$'\037': No such file or directory
> : cannot remove '': No such file or directory
> losetup: /dev/loop13: detach failed: No such device or address
> _U: can't read : No such file or directory
> : : failed to set up loop device: Success
> losetup: /dev/loop12: detach failed: No such device or address
> : syntax error
> : : failed to set up loop device: No such file or directory
> : /dev/: failed to set up loop device: No such file or directory
> losetup: /dev/loop0: detach failed: No such device or address
> No such file or directory
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in
> this email
>
>
>
> Thanks,
> Rong Chen
>

--===============4962985675749286233==--

