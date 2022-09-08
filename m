Content-Type: multipart/mixed; boundary="===============6482679158242903751=="
MIME-Version: 1.0
From: Yin, Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: d4252071b9: fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec -26.5% regression
Date: Thu, 08 Sep 2022 16:55:47 +0800
Message-ID: <0214b84c-71fe-2133-b69d-1e39a19cc468@intel.com>
In-Reply-To: <CAHk-=wgG=mttS-m2OLcnsTwia2roHR2b-DxXXG-tbDH8_cUNiA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6482679158242903751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On 9/1/2022 12:46 AM, Linus Torvalds wrote:
> So I think we can just do this:
> =

>   --- a/include/linux/buffer_head.h
>   +++ b/include/linux/buffer_head.h
>   @@ -137,12 +137,14 @@ BUFFER_FNS(Defer_Completion, defer_completion)
> =

>    static __always_inline void set_buffer_uptodate(struct buffer_head *bh)
>    {
>   -     /*
>   -      * make it consistent with folio_mark_uptodate
>   -      * pairs with smp_load_acquire in buffer_uptodate
>   -      */
>   -     smp_mb__before_atomic();
>   -     set_bit(BH_Uptodate, &bh->b_state);
>   +     if (!test_bit(BH_Uptodate, &bh->b_state)) {
>   +             /*
>   +              * make it consistent with folio_mark_uptodate
>   +              * pairs with smp_load_acquire in buffer_uptodate
>   +              */
>   +             smp_mb__before_atomic();
>   +             set_bit(BH_Uptodate, &bh->b_state);
>   +     }
>    }
> =

>    static __always_inline void clear_buffer_uptodate(struct buffer_head *=
bh)
> =

> and re-introduce the original code (maybe extend that comment to talk
> about this "only first up-to-date matters".
Test result:

commit:
  e394ff83bbca1c72427b1feb5c6b9d4dad832f01  -> parent of bad commit
  d4252071b97d2027d246f6a82cbee4d52f618b47  -> bad commit
  6812880b7af46dc2a78ad2069e5279adcbfd5133  -> The fixing patch commit

e394ff83bbca1c72 d4252071b97d2027d246f6a82cb 6812880b7af46dc2a78ad2069e5
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      0.01 =C2=B1  3%     +30.7%       0.01 =C2=B1  4%      -2.5%       0.0=
1 =C2=B1  3%  fxmark.ssd_ext4_no_jnl_DWTL_18_directio.secs
      0.14 =C2=B1  3%     +29.3%       0.18 =C2=B1  5%      -4.9%       0.1=
3 =C2=B1  6%  fxmark.ssd_ext4_no_jnl_DWTL_18_directio.sys_sec
     20.21 =C2=B1  4%     +16.6%      23.58            -7.7%      18.66 =C2=
=B1  5%  fxmark.ssd_ext4_no_jnl_DWTL_18_directio.sys_util
   3377886 =C2=B1  3%     -23.4%    2586083 =C2=B1  4%      +2.6%    346679=
6 =C2=B1  3%  fxmark.ssd_ext4_no_jnl_DWTL_18_directio.works/sec

      0.06           +15.9%       0.07 =C2=B1  2%      +2.7%       0.06    =
    fxmark.ssd_ext4_no_jnl_DWTL_2_directio.real_sec
      0.03           +24.9%       0.04 =C2=B1  3%      +3.4%       0.03    =
    fxmark.ssd_ext4_no_jnl_DWTL_2_directio.secs
      0.07           +23.8%       0.09 =C2=B1  5%      -4.8%       0.07 =C2=
=B1  7%  fxmark.ssd_ext4_no_jnl_DWTL_2_directio.sys_sec
     55.34 =C2=B1  3%      +7.1%      59.26 =C2=B1  3%      -7.3%      51.2=
8 =C2=B1  7%  fxmark.ssd_ext4_no_jnl_DWTL_2_directio.sys_util
    738881           -19.9%     592194 =C2=B1  3%      -3.3%     714200    =
    fxmark.ssd_ext4_no_jnl_DWTL_2_directio.works/sec

     38.31 =C2=B1  3%     -20.0%      30.64 =C2=B1  9%     -15.8%      32.2=
7 =C2=B1  8%  fxmark.ssd_ext4_no_jnl_DWTL_4_directio.idle_util
      0.02           +30.0%       0.03 =C2=B1  5%      +4.6%       0.02    =
    fxmark.ssd_ext4_no_jnl_DWTL_4_directio.secs
      0.08 =C2=B1  5%     +32.0%       0.11           +16.0%       0.10 =C2=
=B1 12%  fxmark.ssd_ext4_no_jnl_DWTL_4_directio.sys_sec
     41.65 =C2=B1  2%     +22.1%      50.86 =C2=B1  4%      +6.7%      44.4=
3 =C2=B1  7%  fxmark.ssd_ext4_no_jnl_DWTL_4_directio.sys_util
   1163070           -22.9%     896752 =C2=B1  5%      -4.4%    1111656    =
    fxmark.ssd_ext4_no_jnl_DWTL_4_directio.works/sec

      1.32 =C2=B1 18%     -16.6%       1.10 =C2=B1 22%     -22.0%       1.0=
3 =C2=B1  3%  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.irq_util
      0.00 =C2=B1  2%     +25.1%       0.01 =C2=B1  8%      -1.2%       0.0=
0 =C2=B1  4%  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.secs
      0.24 =C2=B1  3%     +37.5%       0.33 =C2=B1  4%     +16.7%       0.2=
8 =C2=B1  2%  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.sys_sec
     11.85 =C2=B1  4%     +30.8%      15.50 =C2=B1  4%     +21.7%      14.4=
1 =C2=B1  6%  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.sys_util
   5031984 =C2=B1  2%     -19.5%    4049295 =C2=B1  8%      +1.3%    509950=
6 =C2=B1  4%  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec

      0.00 =C2=B1  3%     +37.5%       0.01 =C2=B1 11%     +13.8%       0.0=
0 =C2=B1  9%  fxmark.ssd_ext4_no_jnl_DWTL_72_directio.secs
      0.33 =C2=B1  9%     +29.0%       0.43 =C2=B1  8%     +12.0%       0.3=
7 =C2=B1  8%  fxmark.ssd_ext4_no_jnl_DWTL_72_directio.sys_sec
     12.11 =C2=B1 10%     +21.9%      14.76 =C2=B1  6%     +12.5%      13.6=
3 =C2=B1  7%  fxmark.ssd_ext4_no_jnl_DWTL_72_directio.sys_util
   5533529 =C2=B1  4%     -26.3%    4078851 =C2=B1 12%     -11.5%    489650=
0 =C2=B1  8%  fxmark.ssd_ext4_no_jnl_DWTL_72_directio.works/sec

The test result looks good (only test with 72 process doesn't restore to sa=
me level as =

original result).

You may notice the test with 36 process are not showed here. It is because =
of the lkp
script problem and we are working on it.

Checked the test result of 36 process manually:
  e394ff83bbca1c72: avg =3D 4267358.820936666  -> the parent of bad commit
  d4252071b97d2027: avg =3D 3821149.8479718883 -> the bad commit
  6812880b7af46dc2: avg =3D 4724775.219265333  -> the fixing patch commit
It looks good also.

> =

> HOWEVER.
> =

> I'd love to hear if you have a clear profile change, and to see
> exactly which set_buffer_uptodate() is *so* important. Honestly, I
> didn't expect the buffer head functions to even really matter much any
> more, with pretty much all IO being about the page cache..

Unfortunately, the valid profile data was not captured yet. We will keep
working on it and share out once we get the valid profile data. Thanks.


Regards
Yin, Fengwei

--===============6482679158242903751==--

