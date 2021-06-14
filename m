Content-Type: multipart/mixed; boundary="===============3942030704548438312=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/fpu] 190757bfda: invalid_opcode:#[##]
Date: Mon, 14 Jun 2021 08:37:07 -0700
Message-ID: <226b1ab3-89de-28b0-186b-bab2c2c4042c@intel.com>
In-Reply-To: <20210614153205.GC28801@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3942030704548438312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/14/21 8:32 AM, kernel test robot wrote:
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	48 89 85 b0 23 00 00 	mov    %rax,0x23b0(%rbp)
>    7:	66 8c c0             	mov    %es,%ax
>    a:	66 89 85 a0 23 00 00 	mov    %ax,0x23a0(%rbp)
>   11:	66 8c d8             	mov    %ds,%ax
>   14:	8b 4d 2c             	mov    0x2c(%rbp),%ecx
>   17:	66 89 85 a2 23 00 00 	mov    %ax,0x23a2(%rbp)
>   1e:	81 e1 00 00 20 00    	and    $0x200000,%ecx
>   24:	0f 85 c4 00 00 00    	jne    0xee
>   2a:*	0f 01 ee             	rdpkru 		<-- trapping instruction
>   2d:	89 85 14 24 00 00    	mov    %eax,0x2414(%rbp)
>   33:	b9 15 00 00 00       	mov    $0x15,%ecx
>   38:	48 89 df             	mov    %rbx,%rdi
>   3b:	48                   	rex.W
>   3c:	c7                   	.byte 0xc7
>   3d:	43                   	rex.XB
>   3e:	e8                   	.byte 0xe8

In case it saves anyone 10 seconds of looking, this appears to just be a
regular old missed feature check.  Totally untested patch attached.

--===============3942030704548438312==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="rdpkru-check.patch"

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3g4Ni9rZXJuZWwv
cHJvY2Vzcy5jCmluZGV4IDJmZGJhMzMuLjkzYWY3NDkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tl
cm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYwpAQCAtMTY3LDcg
KzE2Nyw4IEBAIGludCBjb3B5X3RocmVhZCh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCB1bnNp
Z25lZCBsb25nIHNwLCB1bnNpZ25lZCBsb25nIGFyZywKIAkgKiBDbG9uZSBjdXJyZW50J3MgUEtS
VSB2YWx1ZSBmcm9tIGhhcmR3YXJlLiB0c2stPnRocmVhZC5wa3J1CiAJICogaXMgb25seSB2YWxp
ZCB3aGVuIHNjaGVkdWxlZCBvdXQuCiAJICovCi0JcC0+dGhyZWFkLnBrcnUgPSByZHBrcnUoKTsK
KwlpZiAoY3B1X2ZlYXR1cmVfZW5hYmxlZChYODZfRkVBVFVSRV9PU1BLRSkpCisJCXAtPnRocmVh
ZC5wa3J1ID0gcmRwa3J1KCk7CiAKIAlmcmFtZS0+YnggPSAwOwogCSpjaGlsZHJlZ3MgPSAqY3Vy
cmVudF9wdF9yZWdzKCk7Cg==

--===============3942030704548438312==--

