Content-Type: multipart/mixed; boundary="===============9187953638713466889=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [pcpu] BUG: KASAN: use-after-scope in pcpu_setup_first_chunk+0x1e3b/0x29e2
Date: Thu, 30 Nov 2017 11:56:22 -0800
Message-ID: <CAGXu5j+om_oZ63OkJwGJNpVgBPxm9Nwc_JwbR3cpfugDPN7X+w@mail.gmail.com>
In-Reply-To: <20171130192257.GB1529@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============9187953638713466889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 11:22 AM, Dennis Zhou <dennisszhou@gmail.com> wro=
te:
> Hi Dmitry and Kees,
>
> On Thu, Nov 30, 2017 at 10:10:41AM -0800, Kees Cook wrote:
>> > Are we sure that structleak plugin is not at fault? If yes, then we
>> > need to report this to https://gcc.gnu.org/bugzilla/ with instructions
>> > on how to build/use the plugin.
>
> I believe this is an issue with the structleak plugin and not gcc. The
> bug does not show up if you compile without
> GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
>
> It seems to be caused by the initializer not respecting the ASAN_MARK
> calls. Therefore, if an inlined function gets called from a for loop,
> the initializer code gets invoked bugging in the second iteration. Below
> is the tree dump for the structleak plugin from the reproducer in the
> previous email. In bb 2 of INIT_LIST_HEAD, the __u =3D {} is before the
> unpoison call. This is inlined in bb 3 of main.

Ah-ha, okay. Thanks for the close examination. Ard, is this something
you have a few moment to take a look at?

-Kees

>
>>
>> I thought from earlier in this thread that the bug just changed
>> locations depending on the plugin. Does the issue still exist with the
>> plugin disabled?
>>
>
> The bug changing locations was me just verifying it was not an issue
> with percpu memory. I manually unrolled the for loop to show that the
> percpu bug disappears, but manifests later on. The issue does not exist
> with the BY_REF_ALL config.
>
> Thanks,
> Dennis
>
> ----
>
> ;; Function __write_once_size (__write_once_size, funcdef_no=3D2, decl_ui=
d=3D3117, cgraph_uid=3D2, symbol_order=3D2)
>
> __attribute__((always_inline))
> __write_once_size (volatile void * p, void * res, int size)
> {
>   unsigned char _1;
>   short unsigned int _2;
>   unsigned int _3;
>   long unsigned int _4;
>   long unsigned int _5;
>
>   <bb 2> [0.00%]:
>   switch (size_7(D)) <default: <L4> [0.00%], case 1: <L0> [0.00%], case 2=
: <L1> [0.00%], case 4: <L2> [0.00%], case 8: <L3> [0.00%]>
>
> <L0> [0.00%]:
>   _1 =3D MEM[(__u8 *)res_9(D)];
>   MEM[(volatile __u8 *)p_10(D)] =3D{v} _1;
>   goto <bb 8>; [0.00%]
>
> <L1> [0.00%]:
>   _2 =3D MEM[(__u16 *)res_9(D)];
>   MEM[(volatile __u16 *)p_10(D)] =3D{v} _2;
>   goto <bb 8>; [0.00%]
>
> <L2> [0.00%]:
>   _3 =3D MEM[(__u32 *)res_9(D)];
>   MEM[(volatile __u32 *)p_10(D)] =3D{v} _3;
>   goto <bb 8>; [0.00%]
>
> <L3> [0.00%]:
>   _4 =3D MEM[(__u64 *)res_9(D)];
>   MEM[(volatile __u64 *)p_10(D)] =3D{v} _4;
>   goto <bb 8>; [0.00%]
>
> <L4> [0.00%]:
>   _5 =3D (long unsigned int) size_7(D);
>   __builtin_memcpy (p_10(D), res_9(D), _5);
>
>   <bb 8> [0.00%]:
>   return;
>
> }
>
>
>
> ;; Function INIT_LIST_HEAD (INIT_LIST_HEAD, funcdef_no=3D3, decl_uid=3D31=
29, cgraph_uid=3D3, symbol_order=3D3)
>
>
> Symbols to be put in SSA form
> { D.3149 }
> Incremental SSA update started at block: 0
> Number of blocks in CFG: 9
> Number of blocks to update: 8 ( 89%)
>
>
> __attribute__((always_inline))
> INIT_LIST_HEAD (struct list_head * list)
> {
>   volatile void * p;
>   void * res;
>   int size;
>   union
>   {
>     struct list_head * __val;
>     char __c[1];
>   } __u;
>   struct list_head * D.3135;
>   struct list_head * * _1;
>   struct list_head * _7;
>   unsigned char _13;
>   short unsigned int _14;
>   unsigned int _15;
>   long unsigned int _16;
>   long unsigned int _17;
>
>   <bb 2> [0.00%]:
>   __u =3D {};
>   ASAN_MARK (UNPOISON, &__u, 8);
>   __u.__val =3D list_4(D);
>   _1 =3D &list_4(D)->next;
>   p_10 =3D _1;
>   res_11 =3D &__u.__c;
>   size_12 =3D 8;
>   switch (size_12) <default: <L4> [0.00%], case 1: <L0> [0.00%], case 2: =
<L1> [0.00%], case 4: <L2> [0.00%], case 8: <L3> [0.00%]>
>
> <L0> [0.00%]:
>   _13 =3D MEM[(__u8 *)res_11];
>   MEM[(volatile __u8 *)p_10] =3D{v} _13;
>   goto <bb 8>; [0.00%]
>
> <L1> [0.00%]:
>   _14 =3D MEM[(__u16 *)res_11];
>   MEM[(volatile __u16 *)p_10] =3D{v} _14;
>   goto <bb 8>; [0.00%]
>
> <L2> [0.00%]:
>   _15 =3D MEM[(__u32 *)res_11];
>   MEM[(volatile __u32 *)p_10] =3D{v} _15;
>   goto <bb 8>; [0.00%]
>
> <L3> [0.00%]:
>   _16 =3D MEM[(__u64 *)res_11];
>   MEM[(volatile __u64 *)p_10] =3D{v} _16;
>   goto <bb 8>; [0.00%]
>
> <L4> [0.00%]:
>   _17 =3D (long unsigned int) size_12;
>   __builtin_memcpy (p_10, res_11, _17);
>
>   <bb 8> [0.00%]:
>   _7 =3D __u.__val;
>   ASAN_MARK (POISON, &__u, 8);
>   list_4(D)->prev =3D list_4(D);
>   return;
>
> }
>
>
>
> ;; Function main (main, funcdef_no=3D4, decl_uid=3D3138, cgraph_uid=3D4, =
symbol_order=3D4)
>
>
> Symbols to be put in SSA form
> { D.3150 }
> Incremental SSA update started at block: 0
> Number of blocks in CFG: 13
> Number of blocks to update: 12 ( 92%)
>
>
> main (int argc, char * * argv)
> {
>   struct list_head * D.3165;
>   union
>   {
>     struct list_head * __val;
>     char __c[1];
>   } __u;
>   int size;
>   void * res;
>   volatile void * p;
>   struct list_head * list;
>   int i;
>   struct list_head * p;
>   int D.3146;
>   long unsigned int _1;
>   long unsigned int _2;
>   struct list_head * _3;
>   int _11;
>   struct list_head * * _15;
>   unsigned char _19;
>   short unsigned int _20;
>   unsigned int _21;
>   long unsigned int _22;
>   long unsigned int _23;
>   struct list_head * _24;
>
>   <bb 2> [0.00%]:
>   __u =3D {};
>   p_8 =3D malloc (160);
>   i_9 =3D 0;
>   goto <bb 10>; [0.00%]
>
>   <bb 3> [0.00%]:
>   _1 =3D (long unsigned int) i_4;
>   _2 =3D _1 * 16;
>   _3 =3D p_8 + _2;
>   list_14 =3D _3;
>   __u =3D {};
>   ASAN_MARK (UNPOISON, &__u, 8);
>   __u.__val =3D list_14;
>   _15 =3D &list_14->next;
>   p_16 =3D _15;
>   res_17 =3D &__u.__c;
>   size_18 =3D 8;
>   switch (size_18) <default: <L8> [0.00%], case 1: <L4> [0.00%], case 2: =
<L5> [0.00%], case 4: <L6> [0.00%], case 8: <L7> [0.00%]>
>
> <L4> [0.00%]:
>   _19 =3D MEM[(__u8 *)res_17];
>   MEM[(volatile __u8 *)p_16] =3D{v} _19;
>   goto <bb 9>; [0.00%]
>
> <L5> [0.00%]:
>   _20 =3D MEM[(__u16 *)res_17];
>   MEM[(volatile __u16 *)p_16] =3D{v} _20;
>   goto <bb 9>; [0.00%]
>
> <L6> [0.00%]:
>   _21 =3D MEM[(__u32 *)res_17];
>   MEM[(volatile __u32 *)p_16] =3D{v} _21;
>   goto <bb 9>; [0.00%]
>
> <L7> [0.00%]:
>   _22 =3D MEM[(__u64 *)res_17];
>   MEM[(volatile __u64 *)p_16] =3D{v} _22;
>   goto <bb 9>; [0.00%]
>
> <L8> [0.00%]:
>   _23 =3D (long unsigned int) size_18;
>   __builtin_memcpy (p_16, res_17, _23);
>
>   <bb 9> [0.00%]:
>   _24 =3D __u.__val;
>   ASAN_MARK (POISON, &__u, 8);
>   list_14->prev =3D list_14;
>   i_13 =3D i_4 + 1;
>
>   <bb 10> [0.00%]:
>   # i_4 =3D PHI <i_9(2), i_13(9)>
>   if (i_4 <=3D 9)
>     goto <bb 3>; [0.00%]
>   else
>     goto <bb 11>; [0.00%]
>
>   <bb 11> [0.00%]:
>   free (p_8);
>   _11 =3D 0;
>
> <L3> [0.00%]:
>   return _11;
>
> }
>
>
>
> ;; Function _GLOBAL__sub_I_00099_0_main (_GLOBAL__sub_I_00099_0_main, fun=
cdef_no=3D5, decl_uid=3D3178, cgraph_uid=3D3, symbol_order=3D8)
>
> _GLOBAL__sub_I_00099_0_main ()
> {
>   <bb 2> [0.00%]:
>   __builtin___asan_init ();
>   __builtin___asan_version_mismatch_check_v8 ();
>   return;
>
> }
>
>



-- =

Kees Cook
Pixel Security

--===============9187953638713466889==--

