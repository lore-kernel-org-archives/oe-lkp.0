Content-Type: multipart/mixed; boundary="===============5320565877664238405=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] e44e907dd8: phoronix-test-suite.glmark2.800x600.score -64.9% regression
Date: Wed, 17 Jun 2020 09:35:41 +0800
Message-ID: <4227c06c-233e-dfcb-e498-185116d6daf5@intel.com>
In-Reply-To: <CACvgo5111Z6Zq4SYYKOJTbiSYPwY2JmG7apX=qx4k3e1DPO62Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5320565877664238405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Emil,

Thanks for the guidance, we'll add these information in future reports.

Best Regards,
Rong Chen

On 6/16/20 9:49 PM, Emil Velikov wrote:
> Hi Rong,
>
> Thanks for the prompt reply and information. Can I suggest including
> the suggested information in future reports.
> I've included a command for each one, to aid automating things.
>
> Namely:
> Xorg: 1.20.4 (or None)
> $ which Xorg 2>/dev/null  || echo None && Xorg -version |& grep -o "X
> Server.*" | sed "s/X Server//"
>
> Mesa: 20.0.7
> $ grep -E -o "Mesa [1-9]+.*" | head -n1 | sed "s/Mesa//"
>
> Mesa module: swrast_dri.so
> $ basename `LD_DEBUG=3Dlibs glxinfo |& grep _dri.so | head -n1 | cut -f3 =
-d:`
>
> Mesa device: llvmpipe (LLVM 10.0.0, 128 bits) (0xffffffff)
> $ glxinfo | grep -i device | cut -f2 -d:
>
> GPU: Matrox Electronics ...
> $ lspci -nn | grep -E "VGA|Display|3D" | cut -f2- -d:
>
> Thanks
> -Emil

--===============5320565877664238405==--

