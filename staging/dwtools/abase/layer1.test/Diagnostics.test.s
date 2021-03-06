( function _Diagnostics_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _ = _global_.wTools;

//

function _err( test )
{

  var errMsg1 = 'some error message',
    fileName = 'Diagnostics.test.s',
    errObj1 = new Error('err obj for tesst'),
    errMsg2 = errObj1.message,
    errObj2 = new Error('Error #3'),
    errMsg3 = errObj2.message,
    optionsObj1 =
    {
      level: 2,
      args: null
    },
    optionsObj2 =
    {
      level: 2,
      args: [ errMsg1 ]
    },
    optionsObj3 =
    {
      level: 3,
      args: [ errObj1 ]
    },

    optionsObj4 =
    {
      level: 3,
      args: [ errMsg1, errObj2 ]
    };

  test.description = 'single string passed as args property: result should be Error obj';
  var got = _._err(optionsObj2);
  test.identical( got instanceof Error, true );

  test.description = 'single string passed as args property: result message should contains passed string';
  var expectMsg = new RegExp(errMsg1);
  test.identical(expectMsg.test(got.message), true);

  test.description = 'single string passed as args property: result message should contains file name';
  var expectFileName = new RegExp(fileName);
  test.identical(expectFileName.test(got.message), true);

  test.description = 'single error instance passed as args property: result should be Error obj';
  var got = _._err(optionsObj3);
  test.identical( got instanceof Error, true );

  test.description = 'single error instance passed as args property: result message should contains passed string';
  var expectMsg = new RegExp(errMsg2);
  test.identical(expectMsg.test(got.message), true);

  test.description = 'single error instance passed as args property: result message should contains file name';
  var expectFileName = new RegExp(errObj1.fileName);
  test.identical(expectFileName.test(got.message), true);

  test.description = 'several error instances/messages passed as args property: result should be Error obj';
  var got = _._err(optionsObj4);
  test.identical( got instanceof Error, true );

  test.description = 'several error instances/messages passed as args: result message should contains all ' +
    'passed string';
  var expectMsg1 = new RegExp(errMsg3),
    expectMsg2 = new RegExp(errMsg1);
  test.identical( [ expectMsg1.test( got.message ), expectMsg2.test( got.message ) ], [ true, true ]);

  test.description = 'several error instances/messages passed as args property: result message should contains ' +
    'file name';
  var expectFileName = new RegExp(fileName);
  test.identical(expectFileName.test(got.message), true);

  /**/

  if( Config.debug )
  {

    test.description = 'missed argument';
    test.shouldThrowError( function()
    {
      _._err();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _._err( optionsObj1, optionsObj2 );
    });

    test.description = 'options.args not array';
    test.shouldThrowError( function()
    {
      _._err( optionsObj1 );
    });

  }

}

//

function err( test )
{
  var errMsg1 = 'some error message',
    fileName = 'Diagnostics.test.s',
    errObj1 = new Error('err obj for tesst'),
    errMsg2 = errObj1.message,
    errObj2 = new Error('Error #3'),
    errMsg3 = errObj2.message;


  test.description = 'single string passed as args property: result should be Error obj';
  var got = _.err(errMsg1);
  test.identical( got instanceof Error, true );

  test.description = 'single string passed as args property: result message should contains passed string';
  var expectMsg = new RegExp(errMsg1);
  test.identical(expectMsg.test(got.message), true);

  test.description = 'single string passed as args property: result message should contains file name';
  var expectFileName = new RegExp(fileName);
  test.identical(expectFileName.test(got.message), true);

  test.description = 'single error instance passed as args property: result should be Error obj';
  var got = _.err(errObj1);
  test.identical( got instanceof Error, true );

  test.description = 'single error instance passed as args property: result message should contains passed string';
  var expectMsg = new RegExp(errMsg2);
  test.identical(expectMsg.test(got.message), true);

  test.description = 'single error instance passed as args property: result message should contains file name';
  var expectFileName = new RegExp(errObj1.fileName);
  test.identical(expectFileName.test(got.message), true);

  test.description = 'several error instances/messages passed as args property: result should be Error obj';
  var got = _.err(errObj2, errMsg1);
  test.identical( got instanceof Error, true );

  test.description = 'several error instances/messages passed as args: result message should contains all ' +
    'passed string';
  var expectMsg1 = new RegExp(errMsg3),
    expectMsg2 = new RegExp(errMsg1);
  test.identical( [ expectMsg1.test( got.message ), expectMsg2.test( got.message ) ], [ true, true ]);

  test.description = 'several error instances/messages passed as args property: result message should contains ' +
    'file name';
  var expectFileName = new RegExp(fileName);
  test.identical(expectFileName.test(got.message), true);

};

//

function errLog( test )
{
  var errMsg1 = 'some error message',
    fileName = 'Diagnostics.test.s',
    errObj1 = new Error('err obj for tesst'),
    errMsg2 = errObj1.message;


  test.description = 'single string passed as args property: result should be Error obj';
  var got = _.errLog(errMsg1);
  test.identical( got instanceof Error, true );

  test.description = 'single string passed as args property: result message should contains passed string';
  var expectMsg = new RegExp(errMsg1);
  test.identical(expectMsg.test(got.message), true);

  test.description = 'single string passed as args property: result message should contains file name';
  var expectFileName = new RegExp(fileName);
  test.identical(expectFileName.test(got.message), true);

  test.description = 'single error instance passed as args property: result should be Error obj';
  var got = _.errLog(errObj1);
  test.identical( got instanceof Error, true );

  test.description = 'single error instance passed as args property: result message should contains passed string';
  var expectMsg = new RegExp(errMsg2);
  test.identical(expectMsg.test(got.message), true);

  test.description = 'single error instance passed as args property: result message should contains file name';
  var expectFileName = new RegExp(errObj1.fileName);
  test.identical(expectFileName.test(got.message), true);
};

//

function assert( test )
{
  var err,
    msg1 = 'short error description',
    rgMsg1 = new RegExp(msg1);

  test.description = 'assert successful condition';
  var got = _.assert(5 === 5);
  test.identical( got, undefined );

  test.description = 'passed failure condition: should generates exception';
  try
  {
    _.assert(5 != 5)
  }
  catch (e)
  {
    err = e;
  }
  test.identical( err instanceof Error, true );

  test.description = 'passed failure condition with passed message: should generates exception with message';
  try
  {
    _.assert(false, msg1)
  }
  catch (e)
  {
    err = e;
  }
  test.identical( rgMsg1.test(err.message), true );
};

//

function stack( test )
{
  function function1()
  {
    return function2();
  }

  function function2()
  {
    return function3();
  }

  function function3()
  {
    return _.stack();
  }

  var expectedTrace = [ 'function3', 'function2', 'function1', 'Diagnostics.test.s' ];

  test.description = 'test stack function sequence';
  var got = function1();
  got = got.split('\n');
  console.log(got.length);
  expectedTrace.forEach( function(v, i)
  {
    var rg = new RegExp(v);
    test.identical(rg.test(got[i]), true);
  });


};

//

var Self =
{

  name : 'diagnostics',
  silencing : 1,

  tests :
  {

    _err   : _err,
    err    : err,
    errLog : errLog,

    assert : assert,
    stack  : stack

  }

}

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
