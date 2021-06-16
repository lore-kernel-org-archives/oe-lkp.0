Content-Type: multipart/mixed; boundary="===============3908832954924015671=="
MIME-Version: 1.0
From: Liu, Yujie <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/fpu] 190757bfda: invalid_opcode:#[##]
Date: Wed, 16 Jun 2021 05:47:40 +0000
Message-ID: <SJ0PR11MB5598223F5322B9CD5816FBADFB0F9@SJ0PR11MB5598.namprd11.prod.outlook.com>
In-Reply-To: <226b1ab3-89de-28b0-186b-bab2c2c4042c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3908832954924015671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

> -----Original Message-----
> From: Dave Hansen <dave.hansen@intel.com>
> Sent: Monday, June 14, 2021 11:37 PM
> To: Sang, Oliver <oliver.sang@intel.com>; Dave Hansen <dave.hansen@li=
nux.intel.com>
> Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>
> Subject: [LKP] Re: [x86/fpu] 190757bfda: invalid_opcode:#[##]
> =

> On 6/14/21 8:32 AM, kernel test robot wrote:
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	48 89 85 b0 23 00 00 	mov    %rax,0x23b0(%rbp)
> >    7:	66 8c c0             	mov    %es,%ax
> >    a:	66 89 85 a0 23 00 00 	mov    %ax,0x23a0(%rbp)
> >   11:	66 8c d8             	mov    %ds,%ax
> >   14:	8b 4d 2c             	mov    0x2c(%rbp),%ecx
> >   17:	66 89 85 a2 23 00 00 	mov    %ax,0x23a2(%rbp)
> >   1e:	81 e1 00 00 20 00    	and    $0x200000,%ecx
> >   24:	0f 85 c4 00 00 00    	jne    0xee
> >   2a:*	0f 01 ee             	rdpkru 		<-- trapping instruction
> >   2d:	89 85 14 24 00 00    	mov    %eax,0x2414(%rbp)
> >   33:	b9 15 00 00 00       	mov    $0x15,%ecx
> >   38:	48 89 df             	mov    %rbx,%rdi
> >   3b:	48                   	rex.W
> >   3c:	c7                   	.byte 0xc7
> >   3d:	43                   	rex.XB
> >   3e:	e8                   	.byte 0xe8
> =

> In case it saves anyone 10 seconds of looking, this appears to just be a =
regular old missed feature check.  Totally untested patch attached.

We have tested the patch and it can fix the issue. Thanks.
--===============3908832954924015671==--

